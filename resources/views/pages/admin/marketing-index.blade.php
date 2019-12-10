@extends('layouts.metronic-1.app')

@section('head')
    <title>Marketing | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Marketing</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
    <a href="{{ url('/marketing/add') }}" class="btn btn-label-success btn-bold btn-sm btn-icon-h kt-margin-l-10">
        Add New
    </a>
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
            <div class="kt-portlet kt-portlet--mobile">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">
                            Data Marketing
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th style="width: 1%">#</th>
                                <th class="text-left" style="width: 70%">Nama</th>
                                <th class="text-center" style="width: 11%">Total Booking</th>
                                <th class="text-center" style="width: 11%">Total Booked</th>
                                <th class="text-center" style="width: 8%"><i class="flaticon2-settings"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($marketing as $m)
                                <tr>
                                    <td class="text-left align-middle"><span>{{ $loop->iteration }}</span></td>
                                    <td class="text-left align-middle"><span>{{ $m->nama }}</span></td>
                                    <td class="text-center align-middle"><span style="font-size: 15px" class="text-primary kt-font-bolder">{{ $m->total_booking_count }}</h5></td>
                                    <td class="text-center align-middle"><span style="font-size: 15px" class="text-success kt-font-bolder">{{ $m->total_booked_count }}</h5></td>
                                    <td class="text-center align-middle">
                                        <a href="{{ url('/marketing/edit/'.$m->id) }}" class="btn btn-primary btn-sm">
                                            <i class="fa fa-edit mr-1"></i>Edit
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="kt-pagination kt-pagination--success mt-3 mb-2">
                        <p class="kt-section__desc"></p>
                        <div class="kt-pagination__toolbar">
                            {{ $marketing->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
@endsection