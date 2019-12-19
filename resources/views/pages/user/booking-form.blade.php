@extends('layouts.metronic-4.app')

@section('head')
    <title>Booking Form | Rantaka</title>
@endsection

@section('subheader')
    <h3 class="kt-subheader__title">
        Booking </h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-link">Home</a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a class="kt-subheader__breadcrumbs-link">Booking</a>
    </div>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Booking Form <small>Unit {{ $properti->blok .'-'.$properti->no_unit }}</small>
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <img src="{{ url('/storage/properti/'.$properti->img_map) }}" width="650px" alt="">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Nama Perumahan</span>
                                        <span><h6>{{ $properti->project->nama }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Blok</span>
                                        <span><h6>{{ $properti->blok }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Luas Tanah</span>
                                        <span>
                                            <h6>
                                                {{ $properti->luas_tanah }}
                                                @if($properti->luas_tanah_lebih != null || $properti->luas_tanah_lebih != 0)
                                                    <span class="kt-font-success">(+{{ $properti->luas_tanah_lebih }})</span>
                                                @endif
                                                m<sup>2</sup>
                                            </h6>
                                        </span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Harga</span>
                                        <span><h6 class="kt-font-brand">Rp {{ number_format($properti->harga_total,0,',','.') }}</h6></span>
                                    </div>
                                </div>
                                <div class="col-lg-6s">
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Tipe Rumah</span>
                                        <span><h6>{{ $properti->nama_tipe->text }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">No. Unit</span>
                                        <span><h6>{{ $properti->no_unit }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Luas Bangunan</span>
                                        <span><h6>{{ $properti->luas_bangunan }} m<sup>2</sup> </h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Booking Fee</span>
                                        <span><h6 class="text-success">Rp {{ number_format($properti->project->booking_fee,0,',','.') }}</h6></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <form method="POST" action="{{ url('/xbooking/store/'.$properti->id) }}">
                                @csrf
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Nama Booker <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <input type="text" name="nama" class="form-control @error('nama') is-invalid @enderror" maxlength="50" value="{{ old('nama') }}" required>
                                        @error('nama')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Alamat Booker <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <textarea name="alamat" class="form-control @error('alamat') is-invalid @enderror" required>{{ old('alamat') }}</textarea>
                                        @error('alamat')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">No. Hp Booker <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <input type="text" name="no_hp" class="form-control @error('no_hp') is-invalid @enderror" maxlength="18" value="{{ old('no_hp') }}" required>
                                        @error('no_hp')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">No. KTP Booker <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <input type="text" name="no_ktp" class="form-control @error('no_ktp') is-invalid @enderror" maxlength="16" value="{{ old('no_ktp') }}" required>
                                        @error('no_ktp')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Pendanaan <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <select class="form-control @error('pendanaan') is-invalid @enderror" id="pendanaan" name="pendanaan" required>
                                            <option value="">- Pilih -</option>
                                            @foreach($pendanaan as $p)
                                                <option value="{{ $p->id }}">{{ $p->nama }}</option>
                                            @endforeach
                                        </select>
                                        @error('pendanaan')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Uang Muka</label>
                                    <div class="col-lg-6">
                                        <select class="form-control @error('dp') is-invalid @enderror" id="dp" name="dp">
                                            <option value="">- Pilih -</option>
                                            <option value="10">10 %</option>
                                            <option value="20">20 %</option>
                                            <option value="30">30 %</option>
                                        </select>
                                        @error('dp')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Cicilan</label>
                                    <div class="col-lg-6">
                                        <select class="form-control @error('cicilan') is-invalid @enderror" id="cicilan" name="cicilan">
                                            <option value="">- Pilih -</option>
                                            <option value="5">5 tgn</option>
                                            <option value="10">10 thn</option>
                                            <option value="15">15 thn</option>
                                            <option value="20">20 thn</option>
                                            <option value="25">25 thn</option>
                                        </select>
                                        @error('cicilan')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Marketing <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <select class="form-control @error('marketing') is-invalid @enderror" id="marketing" name="marketing" required>
                                            <option value="">- Pilih -</option>
                                            @foreach($marketing as $m)
                                                <option value="{{ $m->id }}">{{ $m->nama }}</option>
                                            @endforeach
                                        </select>
                                        @error('marketing')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">Nama Referral <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <input type="text" name="referral" class="form-control @error('referral') is-invalid @enderror" maxlength="50" value="{{ old('referral') }}" required>
                                        @error('referral')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label">No. Hp Referral <small class="text-danger">*</small></label>
                                    <div class="col-lg-6">
                                        <input type="text" name="no_hp_referral" class="form-control @error('no_hp_referral') is-invalid @enderror" maxlength="18" value="{{ old('no_hp_referral') }}" required>
                                        @error('no_hp_referral')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-xl-3">
                                    </div>
                                    <div class="col-lg-9 col-xl-9">
                                        <button type="submit" class="btn btn-success">Submit</button>&nbsp;
                                        <a href="{{ url('/')}}" class="btn btn-secondary">Kembali</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection