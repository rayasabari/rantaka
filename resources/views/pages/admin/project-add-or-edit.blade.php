@extends('layouts.metronic-1.app')

@php $act = Request::segment(2); @endphp

@section('head')
    <title>{{ ucwords($act) }} Project | Rantaka</title>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('a[data-rel^=lightcase]').lightcase();
        });
    </script>
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
            @if($errors->any())
                <div class="alert alert-danger">
                    {{ implode('', $errors->all(':message')) }}
                </div>
            @endif
            <div class="kt-portlet kt-portlet--tabs">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">{{ ucwords($act) }} Project</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        <ul class="nav nav-tabs nav-tabs-bold nav-tabs-line-success nav-tabs-line nav-tabs-line-right" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active mr-2" data-toggle="tab" href="#info_tab" role="tab" id="link_info">
                                    <i class="fa fa-file-alt mr-2"></i> Info 
                                </a>
                            </li>
                            @if($act == 'edit')
                                <li class="nav-item">
                                    <a class="nav-link mr-2" data-toggle="tab" href="#spek_tab" role="tab" id="link_spek">
                                        <i class="fa fa-cog mr-2"></i> Spesifikasi
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#img_tab" role="tab" id="link_img">
                                        <i class="fa fa-image mr-2"></i> Design & Layout
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </div>
                </div>
                
                <div class="kt-portlet__body">
                    <div class="tab-content">
                        <div class="tab-pane active show fade" id="info_tab" role="tabpanel">
                            <form class="kt-form kt-form--label-right" method="post" action="{{ $act == 'add' ? url('/project/add') : url('/project/edit/'.$project->id) }}" enctype="multipart/form-data">
                            @csrf
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
                                            <textarea rows="4" class="form-control" name="deskripsi">{{ $act == 'edit' ? old('deskripsi', $project->deskripsi) : old('deskripsi') }}</textarea>
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
                                                <div class="input-group-prepend"><span class="input-group-text">Ha</div>
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
                                        <label class="col-xl-3 col-lg-3 col-form-label">Biaya Kelebihan Tanah</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                                <input type="text" name="harga_kelebihan_tanah" onkeyup="angka(this)" onblur="angka(this)" class="form-control font-weight-bold" value="{{ $act == 'edit' ? old('harga_kelebihan_tanah', number_format($project->harga_kelebihan_tanah,0,',','.')) : old('harga_kelebihan_tanah') }}" placeholder="" aria-describedby="basic-addon1">
                                                <div class="input-group-prepend"><span class="input-group-text">/m<sup>2</sup></div>
                                            </div>
                                            @error('harga_kelebihan_tanah')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror 
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-xl-3 col-lg-3 col-form-label">Booking Fee</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <div class="input-group">
                                                <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                                <input type="text" name="booking_fee" onkeyup="angka(this)" onblur="angka(this)" class="form-control font-weight-bold" value="{{ $act == 'edit' ? old('booking_fee', number_format($project->booking_fee,0,',','.')) : old('booking_fee') }}" placeholder="" aria-describedby="basic-addon1">
                                            </div>
                                            @error('booking_fee')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror 
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-xl-3 col-lg-3 col-form-label">Site Plan</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <div class="custom-file">
                                                <input name="img_map" type="file" class="custom-file-input text-left @error('img_map') is-invalid @enderror" id="img_map">
                                                <label class="custom-file-label" for="customFile">Pilih file</label>
                                                @if($act == 'edit' && $project->img_map != null) 
                                                    <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                        <a href="{{ url('storage/project/'.$project->img_map) }}" data-rel="lightcase" title="Site Plan">
                                                            <div class="kt-avatar__holder" style="background-image: url('storage/project/{{ $project->img_map }}');"></div>
                                                        </a>
                                                    </div>
                                                @endif
                                                @error('img_map')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-xl-3 col-lg-3 col-form-label">Logo Project</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <div class="custom-file">
                                                <input name="img_logo" type="file" class="custom-file-input text-left @error('img_logo') is-invalid @enderror" id="img_logo">
                                                <label class="custom-file-label" for="customFile">Pilih file</label>
                                                @if($act == 'edit' && $project->img_logo != null ) 
                                                    <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                        <a href="{{ url('storage/project/'.$project->img_logo) }}" data-rel="lightcase" title="Logo Project">
                                                            <div class="kt-avatar__holder" style="background-image: url('storage/project/{{ $project->img_logo }}');"></div>
                                                        </a>
                                                    </div>
                                                @endif
                                                @error('img_logo')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-xl-3 col-lg-3 col-form-label">Tabel Harga</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <div class="custom-file">
                                                <input name="img_harga" type="file" class="custom-file-input text-left @error('img_harga') is-invalid @enderror" id="img_harga">
                                                <label class="custom-file-label" for="customFile">Pilih file</label>
                                                @if($act == 'edit' && $project->img_harga != null ) 
                                                    <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                        <a href="{{ url('storage/project/'.$project->img_harga) }}" data-rel="lightcase" title="Logo Project">
                                                            <div class="kt-avatar__holder" style="background-image: url('storage/project/{{ $project->img_harga }}');"></div>
                                                        </a>
                                                    </div>
                                                @endif
                                                @error('img_harga')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-xl-3 col-lg-3 col-form-label">visibility</label>
                                        <div class="col-lg-9 col-xl-6">
                                            <span class="kt-switch kt-switch--outline kt-switch--icon kt-switch--success">
                                                <label>
                                                    <input type="checkbox" id="visibility" value="1" {{ $act == 'edit' ? $project->visibility == 1 ? 'checked' : '' : '' }} name="visibility">
                                                    <input type="hidden" id="visibilityhide" value="0" name="visibility">
                                                    <span></span>
                                                </label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                @if($act == 'add')
                                    <div class="kt-portlet__foot">
                                        <div class="kt-form__actions">
                                            <div class="row">
                                                <div class="col-lg-3 col-xl-3">
                                                </div>
                                                <div class="col-lg-9 col-xl-9">
                                                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;
                                                    <a href="{{ url('/project') }}" class="btn btn-secondary">Kembali</a>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                        @if($act == 'edit')
                            <div class="tab-pane fade" id="spek_tab" role="tabpanel">
                                <div class="kt-section kt-section--first">
                                    <div class="kt-section__body kt-form kt-form--label-right">
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Pondasi</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_pondasi') is-invalid @enderror" name="spek_pondasi" type="text" value="{{ $act == 'edit' ? old('spek_pondasi', $project->spek_pondasi) : old('spek_pondasi') }}">
                                                @error('spek_pondasi')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Dinding</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_dinding') is-invalid @enderror" name="spek_dinding" type="text" value="{{ $act == 'edit' ? old('spek_dinding', $project->spek_dinding) : old('spek_dinding') }}">
                                                @error('spek_dinding')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Struktur</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_struktur') is-invalid @enderror" name="spek_struktur" type="text" value="{{ $act == 'edit' ? old('spek_struktur', $project->spek_struktur) : old('spek_struktur') }}">
                                                @error('spek_struktur')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Lantai</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_lantai') is-invalid @enderror" name="spek_lantai" type="text" value="{{ $act == 'edit' ? old('spek_lantai', $project->spek_lantai) : old('spek_lantai') }}">
                                                @error('spek_lantai')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Kusen</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_kusen') is-invalid @enderror" name="spek_kusen" type="text" value="{{ $act == 'edit' ? old('spek_kusen', $project->spek_kusen) : old('spek_kusen') }}">
                                                @error('spek_kusen')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Pintu</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_pintu') is-invalid @enderror" name="spek_pintu" type="text" value="{{ $act == 'edit' ? old('spek_pintu', $project->spek_pintu) : old('spek_pintu') }}">
                                                @error('spek_pintu')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Jendela</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_jendela') is-invalid @enderror" name="spek_jendela" type="text" value="{{ $act == 'edit' ? old('spek_jendela', $project->spek_jendela) : old('spek_jendela') }}">
                                                @error('spek_jendela')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Rangka Atap</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_rangka_atap') is-invalid @enderror" name="spek_rangka_atap" type="text" value="{{ $act == 'edit' ? old('spek_rangka_atap', $project->spek_rangka_atap) : old('spek_rangka_atap') }}">
                                                @error('spek_rangka_atap')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Penutup Atap</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_penutup_atap') is-invalid @enderror" name="spek_penutup_atap" type="text" value="{{ $act == 'edit' ? old('spek_penutup_atap', $project->spek_penutup_atap) : old('spek_penutup_atap') }}">
                                                @error('spek_penutup_atap')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Plafond</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_plafond') is-invalid @enderror" name="spek_plafond" type="text" value="{{ $act == 'edit' ? old('spek_plafond', $project->spek_plafond) : old('spek_plafond') }}">
                                                @error('spek_plafond')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Pintu Kamar Mandi</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_pintu_km') is-invalid @enderror" name="spek_pintu_km" type="text" value="{{ $act == 'edit' ? old('spek_pintu_km', $project->spek_pintu_km) : old('spek_pintu_km') }}">
                                                @error('spek_pintu_km')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Kamar Mandi</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_kamar_mandi') is-invalid @enderror" name="spek_kamar_mandi" type="text" value="{{ $act == 'edit' ? old('spek_kamar_mandi', $project->spek_kamar_mandi) : old('spek_kamar_mandi') }}">
                                                @error('spek_kamar_mandi')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Listrik</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_listrik') is-invalid @enderror" name="spek_listrik" type="text" value="{{ $act == 'edit' ? old('spek_listrik', $project->spek_listrik) : old('spek_listrik') }}">
                                                @error('spek_listrik')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Air</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_air') is-invalid @enderror" name="spek_air" type="text" value="{{ $act == 'edit' ? old('spek_air', $project->spek_air) : old('spek_air') }}">
                                                @error('spek_air')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Carport</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_carport') is-invalid @enderror" name="spek_carport" type="text" value="{{ $act == 'edit' ? old('spek_carport', $project->spek_carport) : old('spek_carport') }}">
                                                @error('spek_carport')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror  
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Cat</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control @error('spek_cat') is-invalid @enderror" name="spek_cat" type="text" value="{{ $act == 'edit' ? old('spek_cat', $project->spek_cat) : old('spek_cat') }}">
                                                @error('spek_cat')
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
                                        <div class="col-lg-9 col-xl-9 ml-n3">
                                            <button type="submit" class="btn btn-success">Submit</button>&nbsp;
                                            <a href="{{ url('/project') }}" class="btn btn-secondary">Kembali</a>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="img_tab" role="tabpanel">
                                <div class="row mb-4">
                                    <div class="col-lg-12">
                                        <button type="button" class="btn btn-label-success btn-bold btn-sm" data-toggle="modal" data-target="#modal_upload">Add New</button>
                                    </div>
                                </div>
                                <div class="row">
                                    @foreach($img_tipe as $it)
                                        <div class="col-xl-3 col-lg-4 col-md-6 order-lg-2 order-xl-1 kt-img-rounded">
                                            <div class="kt-portlet kt-portlet--height-fluid kt-widget19">
                                                <div class="kt-portlet__body kt-portlet__body--fit kt-portlet__body--unfill" style="cursor: pointer;">
                                                    <div class="kt-widget19__pic kt-portlet-fit--top kt-portlet-fit--sides" style="min-height: 300px; background-image: url('storage/project/{{ $it->file }}')">
                                                        <h4 class="kt-widget19__title kt-font-light"></h4>
                                                        <div class="kt-widget19__shadow"></div>
                                                        <div class="kt-widget19__labels">
                                                            <form method="post" action="{{ url('project/delete/img_tipe/'.$it->id) }}">
                                                                @method('delete')
                                                                @csrf
                                                                <button type="submit" class="btn btn-danger" data-skin="dark" data-toggle="kt-tooltip" data-placement="top" title="" data-original-title="Delete">
                                                                    <i class="mr-n2 text-right flaticon-delete-1"></i>
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="kt-portlet__body">
                                                    <div class="kt-widget19__wrapper mb-n1 mt-n2">
                                                        <div class="kt-widget19__content mb-n2">
                                                            <div class="kt-widget19__info ml-n3">
                                                                <a class="kt-widget19__username text-center text-black-50">
                                                                    {{ $it->kategori .' - Tipe '. $it->tipe_rumah->text }}
                                                                </a>
                                                            </div>
                                                            <div class="kt-widget19__stats">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endif
                    </div>      
                </div>
            </div>
        </div>
    </div>
    @if($act == 'edit')
        <div class="modal fade" id="modal_upload" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Upload Foto</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" action="{{ url('project/upload/img_tipe/'.$project->id) }}" enctype="multipart/form-data">
                        @csrf
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="exampleSelect1">Tipe Rumah</label>
                                        <select class="form-control" name="tipe_rumah" required>
                                            <option>Pilih</option>
                                            @foreach($tipe_rumah as $tr)
                                                <option value="{{ $tr->id }}">Tipe {{ $tr->text }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleSelect1">Kategori</label>
                                        <select class="form-control" name="kategori" required>
                                            <option>Pilih</option>
                                            @foreach($kategori as $kt)
                                                <option value="{{ $kt['text'] }}">{{ $kt['text'] }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>File Browser</label>
                                        <div class="custom-file">
                                            <input type="file" name="img_tipe" class="custom-file-input" id="customFile" required>
                                            <label class="custom-file-label" for="customFile">Choose file</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Submit</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Kembali</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endif
@endsection

@section('footer_scripts')
    <script>
        $( document ).ready(function() {
            $('#link_info, #link_spek').click(function(){
                $('.kt-portlet__foot').fadeIn(1000);
            });

            $('#link_img').click(function(){
                $('.kt-portlet__foot').hide();
            });

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