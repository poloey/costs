@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card mt-5">
        <div class="card-header">Dashboard</div>
        <div class="card-body">
            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif
            <table class="table table-bordered">
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                </tr>
                @foreach($items as $item)
                <tr>
                    <td>{{$item->name}}</td>
                    <td>{{$item->price}}</td>
                </tr>
                @endforeach
                <tr>
                    <th>total_cost</th>
                    <th>{{$total_cost}}</th>
                </tr>
            </table>
        </div>
    </div>
</div>
@endsection
