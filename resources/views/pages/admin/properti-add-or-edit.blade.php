@extends('layouts.metronic-1.app')

@php $act = Request::segment(2); @endphp

@section('head')
    <title>{{ ucwords($act) }} Properti | Rantaka</title>
@endsection


@section('content_head')
    <h3 class="kt-subheader__title">Properti</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">{{ ucwords($act) }}</span>
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
            <div class="kt-portlet">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">{{ ucwords($act) }} Properti</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        <div class="kt-portlet__head-wrapper">
                        </div>
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ $act == 'add' ? url('/properti/add') : url('/properti/edit/'.$properti->id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Project</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select class="form-control @error('project') is-invalid @enderror" name="project">
                                            <option value="">- Pilih -</option>
                                            @foreach($project as $p)
                                                <option value="{{ $p->id}}" @if($act == 'edit') {{ $properti->id_project == $p->id ? 'selected' : '' }} @else {{ old('project') == $p->id ? 'selected' : '' }} @endif>{{ $p->nama }}</option>s
                                            @endforeach
                                        </select>
                                        @error('project')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Blok</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('blok') is-invalid @enderror" name="blok" type="text" value="{{ $act == 'edit' ? old('blok', $properti->blok) : old('blok') }}">
                                        @error('blok')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">No. Unit</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('no_unit') is-invalid @enderror" name="no_unit" type="text" value="{{ $act == 'edit' ? old('no_unit', $properti->no_unit) : old('no_unit') }}">
                                        @error('no_unit')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Tipe</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select class="form-control @error('tipe') is-invalid @enderror" name="tipe">
                                            <option value="">- Pilih -</option>
                                            @foreach($tipe_rumah as $tr)
                                                <option value="{{ $tr->id }}" @if($act == 'edit') {{ $properti->tipe == $tr->id ? 'selected' : '' }} @else {{ old('tipe') == $tr->id ? 'selected' : '' }} @endif>{{ $tr->text }}</option>
                                            @endforeach
                                        </select>
                                        @error('tipe')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Jumlah Lantai</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('jml_lantai') is-invalid @enderror" name="jml_lantai" type="number" value="{{ $act == 'edit' ? old('jml_lantai', $properti->jml_lantai) : old('jml_lantai') }}">
                                        @error('jml_lantai')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Luas Tanah</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <input type="number" name="luas_tanah" class="form-control" value="{{ $act == 'edit' ? old('luas_tanah', number_format($properti->luas_tanah),0,',','.') : old('luas_tanah') }}" placeholder="" aria-describedby="basic-addon1">
                                            <div class="input-group-prepend"><span class="input-group-text">m<sup>2</span></div>
                                        </div>
                                        @error('luas_tanah')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Luas Bangunan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <input type="number" name="luas_bangunan" class="form-control" value="{{ $act == 'edit' ? old('luas_bangunan', number_format($properti->luas_bangunan),0,',','.') : old('luas_bangunan') }}" placeholder="" aria-describedby="basic-addon1">
                                            <div class="input-group-prepend"><span class="input-group-text">m<sup>2</span></div>
                                        </div>
                                        @error('luas_bangunan')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Harga</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                            <input type="text" name="harga" onkeyup="angka(this)" onblur="angka(this)" class="form-control font-weight-bold" value="{{ $act == 'edit' ? old('harga', number_format($properti->harga,0,',','.')) : old('harga') }}" placeholder="" aria-describedby="basic-addon1">
                                        </div>
                                        @error('harga')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Status</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select class="form-control @error('status') is-invalid @enderror" name="status">
                                            <option value="">- Pilih -</option>
                                            @foreach($stt_properti as $sp)
                                                <option value="{{ $sp->id }}" @if($act == 'edit') {{ $properti->id_status == $sp->id ? 'selected' : '' }} @else {{ old('status') == $sp->id ? 'selected' : '' }} @endif>{{ $sp->text }}</option>
                                            @endforeach
                                        </select>
                                        @error('status')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Map Lokasi Unit</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="custom-file">
                                            <input name="img_map" type="file" class="custom-file-input text-left @error('img_map') is-invalid @enderror" id="img_map">
                                            <label class="custom-file-label" for="customFile">Pilih file</label>
                                            @if($act == 'edit') 
                                                <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                    <div class="kt-avatar__holder" style="background-image: url('storage/properti/{{ $properti->img_map }}');"></div>
                                                </div>
                                            @endif
                                            @error('img_map')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Keterangan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <textarea class="form-control" name="keterangan">{{ $act == 'edit' ? old('keterangan', $properti->keterangan) : old('keterangan') }}</textarea>
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
                                    <a href="{{ url('/properti') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
