@extends('layouts.metronic-4.app')

@section('head')
    <title>Rantaka | Home</title>
@endsection

@section('subheader')
    <h3 class="kt-subheader__title">
        Dashboard </h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="" class="kt-subheader__breadcrumbs-link">
            Dashboard </a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="" class="kt-subheader__breadcrumbs-link">
            Default Dashboard </a>
    </div>
@endsection

@section('content')
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
        <!--begin::Portlet-->
        <div class="kt-portlet kt-portlet--mobile">
            <div class="kt-portlet__head">
                <div class="kt-portlet__head-label">
                    <h3 class="kt-portlet__head-title">
                        Stok Unit
                    </h3>
                </div>
            </div>
            <div class="kt-portlet__body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th style="width: 3%">#</th>
                            <th class="text-center">Blok</th>
                            <th class="text-center">No. Unit</th>
                            <th class="text-center">Tipe</th>
                            <th class="text-center">Jumlah Lantai</th>
                            <th class="text-center">Luas Tanah</th>
                            <th class="text-center">Luas Bangunan</th>
                            <th class="text-center" colspan="2" style="width: 10%">Harga</th>
                            <th class="text-center">Status</th>
                            <th class="text-center" style="width: 12%">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($properti as $p)
                            <tr>
                                <td>{{ ($properti ->currentPage()-1) * $properti ->perPage() + $loop->index + 1 }}</td>
                                <td class="text-center align-middle">{{ $p->blok }}</td>
                                <td class="text-center align-middle">{{ $p->no_unit }}</td>
                                <td class="text-center align-middle">Tipe {{ $p->tipe }}</td>
                                <td class="text-center align-middle">{{ $p->jml_lantai }} lantai</td>
                                <td class="text-center align-middle">{{ $p->luas_tanah }} m<sup>2</sup></td>
                                <td class="text-center align-middle">{{ $p->luas_bangunan }} m<sup>2</sup></td>
                                <td class="text-left align-middle">Rp</td>
                                <td class="text-right align-middle">{{ number_format($p->harga,0,',','.') }}</td>
                                <td class="text-center align-middle">
                                    @if($p->id_status == 1)
                                        <span class="kt-badge kt-badge--success kt-badge--inline kt-badge--pill">{{ $p->status->text }}</span>
                                    @elseif($p->id_status == 2)
                                        <span class="kt-badge kt-badge--warning kt-badge--inline kt-badge--pill">{{ $p->status->text }}</span>
                                    @else  
                                        <span class="kt-badge kt-badge--danger kt-badge--inline kt-badge--pill">{{ $p->status->text }}</span>
                                    @endif
                                </td>
                                <td class="text-right align-middle"><a href="#" class="btn btn-outline-success btn-sm btn-bold" data-toggle="modal" data-target="#modal_{{ $p->id }}"><i class="fa fa-tag mr-2 pt-2"></i>Book Now!</a></td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="kt-pagination kt-pagination--success mt-3 mb-2">
                    <p class="kt-section__desc"></p>
                    <div class="kt-pagination__toolbar">
                        {{ $properti->links() }}
                    </div>
                </div>
                @foreach($properti as $p)
                    <div class="modal fade" id="modal_{{ $p->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Booking Unit {{ $p->blok .'-'. $p->no_unit }}</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    </button>
                                </div>
                                <form method="POST" action="/booking/{{ $p->id }}">
                                @csrf
                                    <div class="modal-body">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Nama<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control @error('nama') is-invalid @enderror" placeholder="" name="nama" value="{{ old('nama') }}" required>
                                                @error('nama')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>Alamat<span class="text-danger">*</span></label>
                                                <textarea class="form-control" @error('alamat') is-invalid @enderror name="alamat" rows="3" required>{{ old('alamat') }}</textarea>
                                                @error('alamat')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>No. Handphone<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control @error('no_hp') is-invalid @enderror" placeholder="" name="no_hp" value="{{ old('no_hp') }}" required>
                                                @error('no_hp')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>Email<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control @error('email') is-invalid @enderror" placeholder="" name="email" value="{{ old('email') }}" required>
                                                @error('email')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>Uang Muka<span class="text-danger">*</span></label>
                                                <select class="form-control @error('dp') is-invalid @enderror" id="dp" name="dp" required>
                                                    <option value="">- Pilih -</option>
                                                    <option value="10">10% ( Rp {{ number_format($p->harga * (10/100),0,',','.') }} )</option>
                                                    <option value="20">20% ( Rp {{ number_format($p->harga * (20/100),0,',','.') }} )</option>
                                                    <option value="30">30% ( Rp {{ number_format($p->harga * (30/100),0,',','.') }} )</option>
                                                </select>
                                                @error('dp')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>Cicilan<span class="text-danger">*</span></label>
                                                <select class="form-control @error('cicilan') is-invalid @enderror" id="cicilan" name="cicilan" required>
                                                    <option value="">- Pilih -</option>
                                                    <option value="5">5 tahun</option>
                                                    <option value="10">10 tahun</option>
                                                    <option value="15">15 tahun</option>
                                                    <option value="25">25 tahun</option>
                                                </select>
                                                @error('cicilan')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        <!--end::Portlet-->
    </div>
@endsection