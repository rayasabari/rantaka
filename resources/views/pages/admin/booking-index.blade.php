@extends('layouts.metronic-1.app')

@section('head')
    <title>Booking | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Booking</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
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
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Daftar Booking
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th style="width: 1%">#</th>
                                <th class="text-left" style="width: 10%">Kode</th>
                                <th class="text-left" style="width:5%">Unit</th>
                                <th class="text-left">Nama</th>
                                <th class="text-left">No. Handphone</th>
                                <th class="text-left">Pendanaan</th>
                                <th class="text-left">Uang Muka</th>
                                <th class="text-left">Cicilan</th>
                                <th class="text-left">Marketing</th>
                                <th class="text-left">Referral</th>
                                <th class="text-center">Status</th>
                                <th class="text-center"><i class="flaticon2-settings"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($booking as $b)
                                <tr>
                                    <td class="text-center align-middle">{{ ($booking ->currentPage()-1) * $booking ->perPage() + $loop->index + 1 }}</td>
                                    <td class="text-left align-middle">{{ $b->kode}}</td>
                                    <td class="text-left align-middle"><a data-skin="dark" data-toggle="kt-tooltip" data-placement="top" title="" data-original-title="{{ $b->properti->project->nama }}">{{ $b->properti->blok .' - '. $b->properti->no_unit }}</a></td>
                                    <td class="text-le text-left align-middle">{{ $b->nama }}</td>
                                    <td class="text-left align-middle">{{ $b->no_hp }}</td>
                                    <td class="text-left align-middle">{{ $b->pendanaan->nama }}</td>
                                    <td class="text-left align-middle">{{ $b->dp }} %</td>
                                    <td class="text-left align-middle">{{ $b->cicilan }} tahun</td>
                                    <td class="text-left align-middle">{{ $b->marketing->nama }}</td>
                                    <td class="text-left align-middle">{{ $b->nama_referral }}</td>
                                    <td class="text-center align-middle">
                                        @if($b->id_status == 1)
                                            <span class="kt-badge kt-badge--warning kt-badge--inline kt-badge--pill text-white">{{ $b->status->text }}</span>
                                        @elseif($b->id_status == 2)
                                            <span class="kt-badge kt-badge--success kt-badge--inline kt-badge--pill">{{ $b->status->text }}</span>
                                        @else  
                                            <span class="kt-badge kt-badge--danger kt-badge--inline kt-badge--pill">{{ $b->status->text }}</span>
                                        @endif
                                    </td>
                                    <td class="text-center align-middle">
                                        <a href="{{ url('/booking/edit/'.$b->id) }}" class="btn kt-font-brand btn-sm btn-icon d-inline" data-skin="dark" data-toggle="kt-tooltip" data-placement="top" title="" data-original-title="Edit">
                                            <i class="fa fa-edit mr-2"></i>Edit
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="kt-pagination kt-pagination--success mt-3 mb-2">
                        <p class="kt-section__desc"></p>
                        <div class="kt-pagination__toolbar">
                            {{ $booking->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection