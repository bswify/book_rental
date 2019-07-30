@extends('layouts.app', ['activePage' => 'dashboard', 'titlePage' => __('Book Rental')])

@section('content')
    <style>
        * {
            margin: 0;
            padding: 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            -o-box-sizing: border-box;
            box-sizing: border-box;
        }

        .book-bg {
            position: relative;
            width: 200px;
            height: 325px;
            margin: 100px auto;
            background: yellow;
            transform-style: preserve-3d;
            perspective: 900px;
            vertical-align: center;
            box-sizing: border-box;
        }

        .book-bg h6 {
            text-align: center;
            padding: 10px;
            margin: 10px;
            position: absolute;
        }


        .book-cover {
            position: absolute;
            width: 100%;
            height: 100%;
            background: red;
            transform-origin: 0 50%;
            transition: all 2000ms linear;
        }

        .book-cover h3 {
            margin: 100px auto;
            text-align: center;
            position: absolute;
            padding-left: 15%;
            padding-top: 25%;
            color: #fff;
        }

        .book-bg:hover .book-cover {
            transform: rotateY(-85deg);
            transform-style: preserve-3d;

        }
    </style>
    <div class="book-bg">
        <h6>Book Rental.</h6>
        <div class="book-cover">
            <h3>Welcome To</h3>
        </div>
    </div>
@endsection


