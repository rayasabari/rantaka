@extends('layouts.metronic-4.app')

@section('head')
    <title>Konfirmasi | Rantaka</title>
@endsection

@section('subheader')
    <h3 class="kt-subheader__title">Konfirmasi</h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <a href="{{ url('/konfirmasi/form/'.$booking->id) }}" class="kt-subheader__breadcrumbs-link">Konfirmasi</a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="{{ url('/konfirmasi/form/'.$booking->id) }}" class="kt-subheader__breadcrumbs-link">Form</a>
    </div>
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
                        <h3 class="kt-portlet__head-title">Submit Konfirmasi</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        <div class="kt-portlet__head-wrapper">
                        </div>
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ url('/konfirmasi/form/'.$booking->id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Bank Tujuan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select class="form-control @error('bank_tujuan') is-invalid @enderror" name="bank_tujuan">
                                            <option value="">- Pilih -</option>
                                            <option value="BCA">BCA (000 000 0000 an PT RANTAKA HABURI RADIKA)</option>
                                            <option value="Mandiri">Mandiri (000 000 0000 an PT RANTAKA HABURI RADIKA)</option>
                                        </select>
                                        @error('bank_tujuan')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Bank Pengirim</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('bank_pengirim') is-invalid @enderror" placeholder="misal: Bank BCA" name="bank_pengirim" type="text" value="">
                                        @error('bank_pengirim')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Nomor Rekening Pengirim</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('no_rek_pengirim') is-invalid @enderror" placeholder="misal: 1231231122" name="no_rek_pengirim" type="text" value="">
                                        @error('no_rek_pengirim')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Atas Nama Pengirim</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('nama_pengirim') is-invalid @enderror" placeholder="misal: Abdul Latief" name="nama_pengirim" type="text" value="">
                                        @error('nama_pengirim')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Tanggal Transfer</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('tgl_transfer') is-invalid @enderror" placeholder="misal: 1231231122" name="tgl_transfer" type="date" value="{{ date('Y-m-d') }}">
                                        @error('tgl_transfer')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Jumlah Transfer</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                            <input class="form-control kt-font-bold @error('jml_transfer') is-invalid @enderror" onkeyup="angka(this)" onblur="angka(this)" placeholder="misal: 30.000.000" name="jml_transfer" type="text" value="">
                                        </div>
                                        @error('jml_transfer')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Bukti Transfer</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="custom-file">
                                            <input name="bukti_transfer" type="file" class="custom-file-input text-left @error('bukti_transfer') is-invalid @enderror" id="bukti_transfer">
                                            <label class="custom-file-label" for="customFile">Pilih file</label>
                                            @error('bukti_transfer')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Catatan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <textarea class="form-control" name="catatan">{{ old('catatan') }}</textarea>
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
                                    <a href="{{ url('/mybooking') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div
@endsection