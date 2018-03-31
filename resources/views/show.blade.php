@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card mt-5">
        <div class="card-header">Dashboard</div>
        <div class="card-body">
            <p><strong>Name:</strong> {{$item->name}} - <span class="badge badge-primary">{{$item->category->name}}</span></p>
            <p>{{$item->description}}</p>
            <p>BDT {{$item->price}}</p>
        </div>
    </div>
</div>
@endsection
