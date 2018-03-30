<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $price_array = Item::all()->pluck('price')->toArray();
        $total_cost = array_reduce($price_array, function($v1, $v2) {
            return $v1 + $v2;
        });
        $items = Item::all();
        return view('home', compact('items', 'total_cost'));
    }
}
