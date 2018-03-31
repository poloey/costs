@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row mt-4">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if(Session::has('message'))
                        <div class="alert alert-success">
                            <p>{{Session::get('message')}}</p>
                        </div>
                    @endif

                    <table class="table table-bordered">
                        <tr>
                            <th>Item</th>
                            <th>Category</th>
                            <th>Price</th>
                        </tr>
                        @foreach($items as $item)
                        <tr>
                            <td>
                                {{$item->name}}
                                <a class="badge badge-primary" style="cursor: pointer;" href="{{route('items.show', $item->id)}}">view</a>
                                <a class="badge badge-info" style="cursor: pointer;" href="{{route('items.edit', $item->id)}}">edit</a>
                                <form method="post" class="d-inline-block" action="{{route('items.destroy', $item->id)}}">
                                    @csrf
                                    @method('delete')
                                    <button style="outline: none; border: none; cursor: pointer;" class="badge badge-danger" type="sumit">Delete</button>
                                </form>
                            </td>
                            <td>
                                {{$item->category->name}}
                            </td>
                            <td>{{$item->price}}</td>
                        </tr>
                        @endforeach
                        <tr>
                            <th colspan="2">total_cost</th>
                            <th>{{$total_cost}}</th>
                        </tr>
                    </table>
                    <div>
                        {{$items->links()}}
                    </div>
                </div>
            </div>
            
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h2>Category</h2>
                </div>
                <div class="card-body">
                    <ul class="list-group">
                        @foreach($categories as $category)
                            <li class="list-group-item"><a href="{{route('items.index', ['category' => $category->id])}}">{{$category->name}}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>



</div>
@endsection
