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
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Booking ID</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ $booking->kode }}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Booker</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ $booking->nama .' ( '. $booking->no_hp .' - '. $booking->email .' )' }}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Alamat Booker</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ $booking->alamat }}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Unit</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ $booking->properti->blok .'-'. $booking->properti->no_unit . ' - Tipe ' . $booking->properti->nama_tipe->text .' ( '. $booking->properti->project->nama .' )' }}" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Uang Muka</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ $booking->dp .' % ( Rp '. number_format( $booking->properti->harga * ($booking->dp / 100),0,',','.') .' )' }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Cicilan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ $booking->cicilan }} tahun">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Tanggal Booking</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ date('d F Y', strtotime($booking->tgl_book )) .' pkl '. date('H:i', strtotime($booking->tgl_book )) }}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Tanggal Expired</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control" type="text" value="{{ date('d F Y', strtotime($booking->tgl_expired )) .' pkl '. date('H:i', strtotime($booking->tgl_expired )) }}">
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
                                    <a href="{{ url('/booking') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection