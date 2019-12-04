@extends('layouts.metronic-4.app')

@section('head')
    <title>Our Projects | Rantaka</title>
@endsection

@section('subheader')
    <h3 class="kt-subheader__title">
        Our Project </h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-link">Home</a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="{{ url('/our-project') }}" class="kt-subheader__breadcrumbs-link">Our Project</a>
    </div>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Cooming Soon <small></small>
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <h2 class="text-center">
                        Coming Soon!
                    </h2>
                </div>
            </div>
        </div>
    </div>
@endsection