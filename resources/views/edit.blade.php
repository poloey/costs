@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card mt-5">
        <div class="card-header">Dashboard</div>
        <div class="card-body">
            @if($errors->all())
                <div class="alert alert-danger">
                    @foreach($errors->all() as $error)
                        <li>{{$error}}</li>
                    @endforeach
                </div>
            @endif
            @if(Session::has('message'))
                <div class="alert alert-success">
                    <p>{{Session::get('message')}}</p>
                </div>
            @endif
            <form method="post" action="{{route('items.update', $item->id)}}">
                @csrf
                @method('put')
                <div class="form-group">
                    <label for="category">Choose a category</label>
                    <select class="form-control" name="category" id="category">
                        @foreach($categories as $category)
                            <option value="{{$category->id}}" {{$category->id == $item->category->id ? 'selected' : 'notselected' }}>{{$category->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input value="{{$item->name}}" type="text" name="name" id="name" class="form-control">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input value="{{$item->description}}" type="text" name="description" id="description" class="form-control">
                </div>
                
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" value="{{$item->price}}" name="price" id="price" class="form-control">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-ouline-info">Add item</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
