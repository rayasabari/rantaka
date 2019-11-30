@extends('layouts.metronic-1.app')

@section('head')
    <title>Welcome {{ Auth::user()->name }}</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Dashboard</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc"></span>
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-10 offset-lg-1">
                @include('panels.welcome-panel')
            </div>
        </div>
    </div>
@endsection
