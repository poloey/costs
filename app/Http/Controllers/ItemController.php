<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Item;
use App\Category;
use Session;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        /**
         * only for showing inside date time picker 
         */
        $start = '';
        $end = '';
        if (request('start')) {
            $start = Carbon::parse(request('start'))->toDateString();
        }
        if (request('end')) {
            $end = Carbon::parse(request('end'))->toDateString();
        }
        $paginate = request('paginate') ?? 30;
        // return request('start');
        $items = Item::with('category')->filter(request(['category', 'start', 'end', 'query']))->where('user_id', auth()->id())->orderBy('created_at', 'desc')->paginate($paginate);
        $categories = Category::all();
        $price_array = $items->pluck('price')->toArray();
        $total_cost = array_sum($price_array);

        return view('home', compact('items', 'total_cost', 'categories', 'start', 'end'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('create', ['categories' => Category::all()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:2',
            'price' => 'required|numeric'
        ]);
        Item::create([
            'name' => $request->input('name'),
            'description' => $request->input('description'),
            'price' => $request->input('price'),
            'category_id' => $request->input('category'),
            'user_id' => auth()->id()
        ]);
        Session::flash('message', 'Item added successfully');
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function show(Item $item)
    {
        return view('show', compact('item'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function edit(Item $item)
    {
        if (auth()->id() > 1) {
            return redirect(route('items.index'));
        }
        return view('edit', ['categories' => Category::all(), 'item' => $item]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Item $item)
    {
        if (auth()->id() > 1) {
            return redirect(route('items.index'));
        }
        $this->validate($request, [
            'name' => 'required|min:2',
            'price' => 'required|numeric',
        ]);

        $item->name = $request->input('name');
        $item->description = $request->input('description');
        $item->price = $request->input('price');
        $item->category_id = $request->input('category');
        $item->save();
        Session::flash('message', 'Item edited successfully');
        return redirect()->back();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function destroy(Item $item)
    {
        if (auth()->id() > 1) {
            return redirect(route('items.index'));
        }
        $item->delete();
        Session::flash('message', 'Item deleted successfully');
        return redirect()->back();
    }
}
