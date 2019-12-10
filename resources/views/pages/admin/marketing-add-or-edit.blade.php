@extends('layouts.metronic-1.app')

@php $act = Request::segment(2); @endphp

@section('head')
    <title>{{ ucwords($act) }} Marketing | Rantaka</title>
@endsection


@section('content_head')
    <h3 class="kt-subheader__title">Marketing</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">{{ ucwords($act) }}</span>
@endsection

@section('content')
<div class="row">
        <div class="col-lg-12">
            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif
            @if (session('error'))
                <div class="alert alert-danger">
                    {{ session('error') }}
                </div>
            @endif
            <div class="kt-portlet">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">{{ ucwords($act) }} Marketing</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        <div class="kt-portlet__head-wrapper">
                        </div>
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ $act == 'add' ? url('/marketing/add') : url('/marketing/edit/'.$marketing->id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Nama</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('nama') is-invalid @enderror" name="nama" type="text" value="{{ $act == 'edit' ? old('nama', $marketing->nama) : old('nama') }}">
                                        @error('nama')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Email</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('email') is-invalid @enderror" name="email" type="email" value="{{ $act == 'edit' ? old('email', $marketing->email) : old('email') }}">
                                        @error('email')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__foot">
                        <div class="kt-form__actions">
                            <div class="row">
                                <div class="col-lg-3 col-xl-3">
                                </div>
                                <div class="col-lg-9 col-xl-9">
                                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;
                                    <a href="{{ url('/marketing') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection