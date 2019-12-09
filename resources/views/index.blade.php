@extends('layouts.metronic-4.app')

@section('head')
    <title>Rantaka | Home</title>
    <style>
        /* Extra small devices (phones, 600px and down) */
        @media only screen and (max-width: 600px) {
            .p-logo {margin-top: -30px;margin-bottom: 15px;}
        }

        /* Small devices (portrait tablets and large phones, 600px and up) */
        @media only screen and (min-width: 600px) {
            .p-logo {margin-top: -30px;margin-bottom: 15px;}
        }

        /* Medium devices (landscape tablets, 768px and up) */
        @media only screen and (min-width: 768px) {
            .p-logo {margin-top: -90px;margin-bottom: 50px;}
        } 

        /* Large devices (laptops/desktops, 992px and up) */
        @media only screen and (min-width: 992px) {
            .p-logo {margin-top: -90px;margin-bottom: 50px;}
        } 

        /* Extra large devices (large laptops and desktops, 1200px and up) */
        @media only screen and (min-width: 1200px) {
            .p-logo {margin-top: -90px;margin-bottom: 50px;}
        }
    </style>
@endsection

@section('subheader')
    {{-- <h3 class="kt-subheader__title">
        Dashboard </h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="" class="kt-subheader__breadcrumbs-link">
            Dashboard </a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="" class="kt-subheader__breadcrumbs-link">
            Default Dashboard </a>
    </div> --}}
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12 p-logo">
        <img src="/images/gve_logo.png" alt="" width="650" class="mx-auto d-block img-fluid">
    </div>
</div>
<div class="row">
    <div class="col-lg-12" style="margin-top:33px">
        <img src="/images/gve_map.jpg" alt="" width="1320" class="img-fluid">
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <!--begin::Portlet-->
        <div class="kt-portlet kt-portlet--mobile">
            <div class="kt-portlet__head">
                <div class="kt-portlet__head-label">
                    <h3 class="kt-portlet__head-title">
                        Stok Unit
                    </h3>
                </div>
                <div class="kt-portlet__head-toolbar">
					<div class="kt-portlet__head-actions">
                        <form method="post" action="{{ url('/refresh-stock') }}">
                            @csrf
                            <button type="submit" class="btn btn-outline-brand btn-sm" data-dismiss="modal"><i class="la la-refresh mr-2"></i>Refresh</button>
                        </form>
					</div>
				</div>
            </div>
            <div class="kt-portlet__body">
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
                <ul class="nav nav-tabs nav-tabs-line nav-tabs-line-success" role="tablist">
                    @foreach($list_blok as $lb)
                        <li class="nav-item nav-su">
                            <a class="nav-link mr-3 {{ $lb->blok == 'A' ? 'active' : '' }}" data-toggle="tab" href="#tab_{{ $lb->blok }}" role="tab" aria-selected="true">Blok {{ $lb->blok }}</a>
                        </li>
                    @endforeach
                </ul>
                <div class="tab-content">
                    @foreach($list_blok as $lb)
                        <div class="tab-pane fade {{ $lb->blok == 'A' ? 'show active' : '' }}" id="tab_{{ $lb->blok }}" role="tabpanel">
                            <table class="table table-hover table-responsive">
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
                                        @if(Auth::user())
                                            <th class="text-center" style="width: 11%"><i class="flaticon2-settings"></i></th>
                                        @endif
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($properti->where('blok', $lb->blok) as $key => $p)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td></td>
                                            <td class="text-center align-middle">{{ $p->blok }}</td>
                                            <td class="text-center align-middle">{{ $p->no_unit }}</td>
                                            <td class="text-center align-middle">Tipe {{ $p->nama_tipe->text }}</td>
                                            <td class="text-center align-middle">{{ $p->jml_lantai }} lantai</td>
                                            <td class="text-center align-middle">{{ $p->luas_tanah }} m<sup>2</sup></td>
                                            <td class="text-center align-middle">{{ $p->luas_bangunan }} m<sup>2</sup></td>
                                            <td class="text-left align-middle">Rp</td>
                                            <td class="text-right align-middle">{{ number_format($p->harga,0,',','.') }}</td>
                                            <td class="text-center align-middle">
                                                @if($p->id_status == 1)
                                                    <span class="kt-badge kt-badge--success kt-badge--inline kt-badge--pill">{{ $p->status->text }}</span>
                                                @elseif($p->id_status == 2)
                                                    <span class="kt-badge kt-badge--warning kt-badge--inline kt-badge--pill text-white">{{ $p->status->text }}</span>
                                                @else  
                                                    <span class="kt-badge kt-badge--danger kt-badge--inline kt-badge--pill">{{ $p->status->text }}</span>
                                                @endif
                                            </td>
                                            @if(Auth::user())
                                                <td class="text-center align-middle">
                                                    @if($p->id_status == 1)
                                                        <form method="POST" action="{{ url('/booking/'.$p->id) }}" class="d-inline">
                                                            @csrf 
                                                            <button type="submit" class="btn btn-brand btn-sm ">
                                                                <i class="fa fa-tag mr-2"></i>Book Now!
                                                            </button>
                                                        </form>
                                                    {{-- @elseif($p->id_status == 2)
                                                        @if( strtotime($p->booking->tgl_expired) <= time())
                                                            <a class="btn kt-font-brand btn-sm btn-icon d-inline" data-toggle="modal" data-target="#modal_{{ $p->id }}">
                                                                <i class="fa fa-tag mr-2"></i>Book Now!
                                                            </a>
                                                        @elseif( strtotime($p->booking->tgl_expired) >= time())
                                                            <a class="btn text-black-50 btn-sm btn-icon d-inline">
                                                                <i class="fa fa-tag mr-2"></i>Book Now!
                                                            </a>
                                                        @endif --}}
                                                    @else 
                                                        <button class="btn btn-brand btn-sm" disabled>
                                                            <i class="fa fa-tag mr-2"></i>Book Now!
                                                        </button>
                                                    @endif
                                                </td>
                                            @endif
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
        <!--end::Portlet-->
    </div>
</div>
@endsection