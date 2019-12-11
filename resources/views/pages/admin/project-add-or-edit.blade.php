@extends('layouts.metronic-1.app')

@php $act = Request::segment(2); @endphp

@section('head')
    <title>{{ ucwords($act) }} Project | Rantaka</title>
@endsection


@section('content_head')
    <h3 class="kt-subheader__title">Project</h3>
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
                        <h3 class="kt-portlet__head-title">{{ ucwords($act) }} Project</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        <div class="kt-portlet__head-wrapper">
                        </div>
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ $act == 'add' ? url('/project/add') : url('/project/edit/'.$project->id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Nama</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('nama') is-invalid @enderror" name="nama" type="text" value="{{ $act == 'edit' ? old('nama', $project->nama) : old('nama') }}">
                                        @error('nama')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Deskripsi</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <textarea class="form-control" name="deskripsi">{{ $act == 'edit' ? old('deskripsi', $project->deskripsi) : old('deskripsi') }}</textarea>
                                        @error('deskripsi')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Lokasi</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <textarea class="form-control" name="lokasi">{{ $act == 'edit' ? old('lokasi', $project->lokasi) : old('lokasi') }}</textarea>
                                        @error('lokasi')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Latitude</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('latitude') is-invalid @enderror" name="latitude" type="text" value="{{ $act == 'edit' ? old('latitude', $project->latitude) : old('latitude') }}">
                                        @error('latitude')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Longitude</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('longitude') is-invalid @enderror" name="longitude" type="text" value="{{ $act == 'edit' ? old('longitude', $project->longitude) : old('longitude') }}">
                                        @error('longitude')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Total Luas</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <input type="number" step=".01" name="total_luas" class="form-control" value="{{ $act == 'edit' ? old('total_luas', number_format($project->total_luas,2,'.',',') ) : old('total_luas') }}" placeholder="" aria-describedby="basic-addon1">
                                            <div class="input-group-prepend"><span class="input-group-text">m<sup>2</span></div>
                                        </div>
                                        @error('total_luas')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Tahun Bangun</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('thn_bangun') is-invalid @enderror" name="thn_bangun" type="text" value="{{ $act == 'edit' ? old('thn_bangun', $project->thn_bangun) : old('thn_bangun') }}" maxlength="4">
                                        @error('thn_bangun')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Map Lokasi</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="custom-file">
                                            <input name="img_map" type="file" class="custom-file-input text-left @error('img_map') is-invalid @enderror" id="img_map">
                                            <label class="custom-file-label" for="customFile">Pilih file</label>
                                            @if($act == 'edit') 
                                                <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                    <div class="kt-avatar__holder" style="background-image: url('storage/project/{{ $project->img_map }}');"></div>
                                                </div>
                                            @endif
                                            @error('img_map')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
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
                                    <a href="{{ url('/project') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection