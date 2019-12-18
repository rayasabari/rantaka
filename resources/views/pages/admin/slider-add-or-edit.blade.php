@extends('layouts.metronic-1.app')

@section('head')
    <title>Slider | Rantaka</title>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('a[data-rel^=lightcase]').lightcase();
        });
    </script>
@endsection

@php $act = Request::segment(2); @endphp

@section('content_head')
    <h3 class="kt-subheader__title">Slider</h3>
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
                        <h3 class="kt-portlet__head-title">{{ ucwords($act) }} Slider</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        <div class="kt-portlet__head-wrapper">
                            @if($act == 'edit')
                                <form method="post" action="{{ url('slider/delete/'.$slider->id) }}"> 
                                @method('delete')
                                @csrf
                                    <button class="btn btn-danger btn-sm">Delete</button>
                                </form>
                            @endif
                        </div>
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ $act == 'add' ? url('/slider/add') : url('/slider/edit/'.$slider->id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Foto</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="custom-file">
                                            <input name="img_slider" type="file" class="custom-file-input text-left @error('img_slider') is-invalid @enderror" id="img_slider">
                                            <label class="custom-file-label" for="customFile">Pilih file</label>
                                            @error('img_slider')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                            @if($act == 'edit') 
                                                <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                    <a href="{{ url('storage/slider/'.$slider->nama_file) }}" data-rel="lightcase" title="{{ $slider->judul }}" data-lc-caption="{{ $slider->deskripsi }}">
                                                        <div class="kt-avatar__holder" style="background-image: url('storage/slider/{{ $slider->nama_file }}');"></div>
                                                    </a>
                                                </div>
                                            @endif
                                            <span class="form-text text-muted">Height harus 630px agar tidak stretch!</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Judul</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('judul') is-invalid @enderror" name="judul" type="text" value="{{ $act == 'edit' ? old('judul', $slider->judul) : old('judul') }}">
                                        @error('judul')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Deskripsi</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <textarea rows="4" class="form-control" name="deskripsi">{{ $act == 'edit' ? old('deskripsi', $slider->deskripsi) : old('deskripsi') }}</textarea>
                                        @error('deskripsi')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Url</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('url') is-invalid @enderror" name="url" placeholder="contoh: http://rantaka.id/contact-us" type="text" value="{{ $act == 'edit' ? old('url', $slider->url) : old('url') }}">
                                        @error('url')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Urutan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('urutan') is-invalid @enderror" name="urutan" type="number" value="{{ $act == 'edit' ? old('urutan', $slider->urutan) : old('urutan') }}">
                                        @error('urutan')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">visibility</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <span class="kt-switch kt-switch--outline kt-switch--icon kt-switch--success">
                                            <label>
                                                <input type="checkbox" id="visibility" value="1" {{ $act == 'edit' ? $slider->visibility == 1 ? 'checked' : '' : '' }} name="visibility">
                                                <input type="hidden" id="visibilityhide" value="0" name="visibility">
                                                <span></span>
                                            </label>
                                        </span>
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
                                    <a href="{{ url('/slider') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('footer_scripts')
    <script type="text/javascript">
        $( document ).ready(function() {
            $('#visibility').click(function(){
                $(this).val(this.checked ? 1 : 0);
                if($(this).val() == 1){
                    $('#visibilityhide').prop('disabled', true);
                }else{
                    $('#visibilityhide').prop('disabled', false);
                }
            })

            if($('#visibility').prop('checked')){
                $('#visibilityhide').prop('disabled', true);
            }
        });
    </script>
@endsection

