@extends('layouts.metronic-1.app')

@section('head')
    <title>Update Booking | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Booking</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Update</span>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Update Booking
                        </h3>
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ url('/booking/edit/'.$booking->id) }}">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Booking ID</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ $booking->kode }}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Booker</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ $booking->nama }}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">No. Handphone Booker</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ $booking->no_hp }}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Alamat Booker</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <textarea class="form-control" disabled>{{ $booking->alamat }}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Project</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ $booking->properti->project->nama }}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Blok - Unit</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ $booking->properti->blok .'-'. $booking->properti->no_unit .' (Tipe '. $booking->properti->nama_tipe->text .')' }}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Tanggal Booking</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ date('d F Y', strtotime($booking->tgl_book )) .' pkl '. date('H:i', strtotime($booking->tgl_book )) }}" disabled>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Tanggal Expired</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" type="text" value="{{ date('d F Y', strtotime($booking->tgl_expired )) .' pkl '. date('H:i', strtotime($booking->tgl_expired )) }}" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Uang Muka</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <select class="form-control @error('dp') is-invalid @enderror" id="dp" name="dp">
                                                    <option value="">- Pilih -</option>
                                                    <option value="10" {{ $booking->dp == '10' ? 'selected' : '' }}>{{ $booking->dp .' % ( Rp '. number_format( $booking->properti->harga * ($booking->dp / 100),0,',','.') .' )' }}</option>
                                                    <option value="20" {{ $booking->dp == '20' ? 'selected' : '' }}>{{ $booking->dp .' % ( Rp '. number_format( $booking->properti->harga * ($booking->dp / 100),0,',','.') .' )' }}</option>
                                                    <option value="30" {{ $booking->dp == '30' ? 'selected' : '' }}>{{ $booking->dp .' % ( Rp '. number_format( $booking->properti->harga * ($booking->dp / 100),0,',','.') .' )' }}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Cicilan</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <select class="form-control" id="cicilan" name="cicilan">
                                                    <option value="">- Pilih -</option>
                                                    <option value="5" {{ $booking->cicilan == '5' ? 'selected' : '' }}>{{ $booking->cicilan }} thn</option>
                                                    <option value="10" {{ $booking->cicilan == '10' ? 'selected' : '' }}>{{ $booking->cicilan }} thn</option>
                                                    <option value="15" {{ $booking->cicilan == '15' ? 'selected' : '' }}>{{ $booking->cicilan }} thn</option>
                                                    <option value="20" {{ $booking->cicilan == '20' ? 'selected' : '' }}>{{ $booking->cicilan }} thn</option>
                                                    <option value="25" {{ $booking->cicilan == '25' ? 'selected' : '' }}>{{ $booking->cicilan }} thn</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Marketing</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <select class="form-control" name="marketing">
                                                    <option value="">- Pilih -</option>
                                                    @foreach($marketing as $m)
                                                        <option value="{{ $m->id }}" {{ $booking->id_marketing == $m->id ? 'selected' : '' }}>{{ $m->nama }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Referral</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" name="referral" type="text" value="{{ $booking->nama_referral }}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">No. Handphone Referral</label>
                                            <div class="col-lg-9 col-xl-6">
                                                <input class="form-control" name="no_hp_referral" type="text" value="{{ $booking->no_hp_referral }}" maxlength="16">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label">Status <span class="text-danger">*</span></label>
                                            <div class="col-lg-9 col-xl-6">
                                                <select class="form-control @error('id_status') is-invalid @enderror" name="id_status">
                                                    <option value="">- Pilih -</option>
                                                    @foreach($status_booking as $sb)
                                                        <option value="{{ $sb->id}}" {{ $booking->id_status == $sb->id ? 'selected' : '' }} >{{ $sb->text }}</option>s
                                                    @endforeach
                                                </select>
                                                @error('id_status')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-xl-3 col-lg-3 col-form-label"></label>
                                            <div class="col-lg-9 col-xl-6">
                                                <button type="submit" class="btn btn-success">Simpan</button>&nbsp;
                                                <a href="{{ url('/booking') }}" class="btn btn-secondary">Kembali</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection