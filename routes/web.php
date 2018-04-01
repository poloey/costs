<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
  return redirect(route('items.index'));
});

Route::group(['middleware' => 'auth'], function () {
  Route::resource('items', 'ItemController');
});



Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
