@extends('layouts.metronic-1.app')

@section('head')
    <title>Project | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Project</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
    <a href="{{ url('/project/add') }}" class="btn btn-label-success btn-bold btn-sm btn-icon-h kt-margin-l-10">
        Add New
    </a>
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
                            Data Project
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th style="width: 1%">#</th>
                                <th class="text-left">Nama</th>
                                <th class="text-left">Lokasi</th>
                                <th class="text-center">Total Luas</th>
                                <th class="text-center">Tahun Bangun</th>
                                <th class="text-center">Total Properti</th>
                                <th class="text-center">Available</th>
                                <th class="text-center">Booked</th>
                                <th class="text-center">Sold</th>
                                <th class="text-center" style="width: 8%"><i class="flaticon2-settings"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($project as $p)
                                <tr>
                                    <td class="text-left align-middle"><span>{{ $loop->iteration }}</span></td>
                                    <td class="text-left align-middle"><span>{{ $p->nama }}</span></td>
                                    <td class="text-left align-middle"><span>{{ $p->lokasi }}</h5></td>
                                    <td class="text-center align-middle"><span>{{ $p->total_luas }} Ha</h5></td>
                                    <td class="text-center align-middle"><span>{{ $p->thn_bangun }}</h5></td>
                                    <td class="text-center align-middle"><span style="font-size: 15px" class="text-primary kt-font-bolder">{{ $p->total_count }}</h5></td>
                                    <td class="text-center align-middle"><span style="font-size: 15px" class="text-success kt-font-bolder">{{ $p->available_count + $p->waiting_count  }}</h5></td>
                                    <td class="text-center align-middle"><span style="font-size: 15px" class="text-danger kt-font-bolder">{{ $p->booked_count }}</h5></td>
                                    <td class="text-center align-middle"><span style="font-size: 15px" class="kt-font-brand kt-font-bolder">{{ $p->deal_count }}</h5></td>
                                    <td class="text-center align-middle">
                                        <a href="{{ url('/project/edit/'.$p->id) }}" class="btn btn-label-primary btn-pill btn-sm">
                                            Edit
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="kt-pagination kt-pagination--success mt-3 mb-2">
                        <p class="kt-section__desc"></p>
                        <div class="kt-pagination__toolbar">
                            {{ $project->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
@endsection