<?php

namespace App\Http\Controllers;

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
      $price_array = Item::all()->pluck('price')->toArray();
        $total_cost = array_sum($price_array);
        $items = Item::all();
        return view('home', compact('items', 'total_cost'));
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
            'category_id' => $request->input('category')
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
        $item->delete();
        Session::flash('message', 'Item deleted successfully');
        return redirect()->back();
    }
}
