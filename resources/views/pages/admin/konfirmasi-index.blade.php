@extends('layouts.metronic-1.app')

@section('head')
    <title>Konfirmasi | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Konfirmasi</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif
            @if (session('gagal'))
                <div class="alert alert-danger">
                    {{ session('gagal') }}
                </div>
            @endif
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Data Konfirmasi
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    Konfirmasi
                </div>
            </div>
        </div>
    </div>  
@endsection