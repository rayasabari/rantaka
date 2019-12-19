@extends('layouts.metronic-4.app')

@section('head')
    <title>Project | Rantaka</title>
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
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('a[data-rel^=lightcase]').lightcase();
        });
    </script>
@endsection

@section('subheader')
    <h3 class="kt-subheader__title">
        Our Project </h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="#" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-link">
            Home
        </a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="{{ url('/our-project') }}" class="kt-subheader__breadcrumbs-link">
            Our Project
        </a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="{{ url('/our-project/'.$project->id) }}" class="kt-subheader__breadcrumbs-link">
            {{ $project->nama }}
        </a>
    </div>
@endsection

@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="kt-portlet">
                <div class="kt-portlet__body">
                    <div class="row kt-margin-b-40 kt-margin-t-20">
                        <img src="{{ url('storage/project/'.$project->img_logo) }}" alt="" width="400" class="mx-auto d-block img-fluid">
                    </div>
                    <ul class="nav nav-tabs nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-success" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active mr-4" data-toggle="tab" href="#tab_deskripsi" role="tab" aria-selected="false">Deskripsi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mr-4" data-toggle="tab" href="#tab_desain" role="tab" aria-selected="true">Desain</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mr-4" data-toggle="tab" href="#tab_spek" role="tab" aria-selected="true">Spesifikasi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mr-4" data-toggle="tab" href="#tab_lokasi" role="tab" aria-selected="true">Lokasi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mr-4" data-toggle="tab" href="#tab_angsuran" role="tab" aria-selected="true">Perkiraan Angsuran</a>
                        </li>
                    </ul>                        
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab_deskripsi" role="tabpanel">
                            <div class="kt-section">
                                <div class="kt-section_desc">
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <div class="mb-4">
                                                <p class="text-body lead">{{ $project->deskripsi }}</p>
                                            </div>
                                            <div class="kt-notification-v2">
                                                @foreach($fitur as $f)
                                                <a class="kt-notification-v2__item">
                                                    <div class="kt-notification-v2__item-icon">
                                                        <i class="fa fa-check-double kt-font-success"></i>
                                                    </div>
                                                    <div class="kt-notification-v2__itek-wrapper">
                                                        <div class="kt-notification-v2__item-title">
                                                            {{ $f }}
                                                        </div>
                                                        <div class="kt-notification-v2__item-desc">
                                                        </div>
                                                    </div>	
                                                </a>
                                                @endforeach
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <img src="{{ url('storage/project/'.$project->img_map) }}" width="100%" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab_desain" role="tabpanel">
                            <div class="row">
                                @foreach($project->img_tipe as $it)
                                    <div class="col-xl-3 col-lg-4 col-md-6 order-lg-2 order-xl-1 kt-img-rounded">
                                        <div class="kt-portlet kt-portlet--height-fluid kt-widget19">
                                            <div class="kt-portlet__body kt-portlet__body--fit kt-portlet__body--unfill" style="cursor: pointer;">
                                                <a data-rel="lightcase:myCollection" href="{{ url('storage/project/'.$it->file) }}" data-rel="lightcase" title="Tipe {{ $it->tipe_rumah->text .' - '.  $it->kategori  }}">
                                                    <div class="kt-widget19__pic kt-portlet-fit--top kt-portlet-fit--sides" style="min-height: 300px; background-image: url('storage/project/{{ $it->file }}')">
                                                        <h6 class="kt-widget19__title kt-font-light">
                                                            Klik untuk perbesar
                                                        </h6>
                                                        <div class="kt-widget19__shadow"></div>
                                                        <div class="kt-widget19__labels">
                                                        </div>
                                                    </div>
                                                </a>
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
                        <div class="tab-pane fade" id="tab_spek" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Pondasi</span>
                                        <span class="text-body"><h6>{{ $project->spek_pondasi }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Dinding</span>
                                        <span class="text-body"><h6>{{ $project->spek_dinding }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Struktur</span>
                                        <span class="text-body"><h6>{{ $project->spek_struktur }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Lantai</span>
                                        <span class="text-body"><h6>{{ $project->spek_lantai }}</h6></span>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Kusen</span>
                                        <span class="text-body"><h6>{{ $project->spek_kusen }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Pintu</span>
                                        <span class="text-body"><h6>{{ $project->spek_pintu }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Jendela</span>
                                        <span class="text-body"><h6>{{ $project->spek_jendela }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Rangka Atap</span>
                                        <span class="text-body"><h6>{{ $project->spek_rangka_atap }}</h6></span>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Penutup Atap</span>
                                        <span class="text-body"><h6>{{ $project->spek_penutup_atap }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Plafond</span>
                                        <span class="text-body"><h6>{{ $project->spek_plafond }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Pintu Kamar Mandi</span>
                                        <span class="text-body"><h6>{{ $project->spek_pintu_km }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Kamar Mandi</span>
                                        <span class="text-body"><h6>{{ $project->spek_kamar_mandi }}</h6></span>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Listrik</span>
                                        <span class="text-body"><h6>{{ $project->spek_listrik }} Watt</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Air</span>
                                        <span class="text-body"><h6>{{ $project->spek_air }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Carport</span>
                                        <span class="text-body"><h6>{{ $project->spek_carport }}</h6></span>
                                        <hr>
                                    </div>
                                    <div class="form-group">
                                        <span class="text-black-50 d-block mb-1">Cat</span>
                                        <span class="text-body"><h6>{{ $project->spek_cat }}</h6></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab_angsuran" role="tabpanel">
                            <img class="img-thumbnail" src="{{ url('storage/project/'.$project->img_harga) }}" width="100%" alt="">
                        </div>
                        <div class="tab-pane fade" id="tab_lokasi" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-8">
                                    <div id="map" style="height: 400px;"></div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="kt-notification-v2">
                                        @foreach($sekitar_lokasi as $sl)
                                        <a class="kt-notification-v2__item">
                                            <div class="kt-notification-v2__item-icon">
                                                <i class="fa fa-check-double kt-font-success"></i>
                                            </div>
                                            <div class="kt-notification-v2__itek-wrapper">
                                                <div class="kt-notification-v2__item-title">
                                                    {{ $sl }}
                                                </div>
                                                <div class="kt-notification-v2__item-desc">
                                                </div>
                                            </div>	
                                        </a>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>         
                </div>
            </div>
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
                                            <th class="text-center" style="width: 11%"><i class="flaticon2-settings"></i></th>
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
                                                <td class="text-center align-middle">
                                                    {{ $p->luas_tanah .' '}} 
                                                    @if( $p->luas_tanah_lebih != null || $p->luas_tanah_lebih != 0) 
                                                        <span class="kt-font-success">(+{{ $p->luas_tanah_lebih }})</span>
                                                    @endif
                                                    m<sup>2</sup>
                                                </td>
                                                <td class="text-center align-middle">{{ $p->luas_bangunan }} m<sup>2</sup></td>
                                                <td class="text-left align-middle kt-font-bold" style="font-size: 14px">Rp</td>
                                                <td class="text-right align-middle kt-font-bold" style="font-size: 14px">{{ number_format($p->harga_total,0,',','.') }}</td>
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
                                                                <button type="submit" class="btn btn-brand btn-sm">
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
                                                @else 
                                                    <td class="text-center align-middle">
                                                        @if($p->id_status == 1)
                                                            <button type="button" class="btn btn-brand btn-sm" data-toggle="modal" data-target="#kt_modal_6">
                                                                <i class="fa fa-tag mr-2"></i>Book Now!
                                                            </button>
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
                        <div class="modal fade" id="kt_modal_6" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="display: none;">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    {{-- <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLongTitle">Booking</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        </button>
                                    </div> --}}
                                    <div class="modal-body text-center text-body">
                                        <h3 class="kt-font-boldest mt-4 mb-4">Hubungi!</h3> 
                                        <h4>
                                            <i class="fa fa-phone-alt mr-2 text-success"></i> 021 3001 6002
                                        </h4>
                                        <h6>atau</h6>
                                        <h4>
                                            <i class="fa fa-mobile-alt mr-2 text-success"></i> 0822 1089 8969
                                        </h4>
                                        <h4>
                                            <i class="fa fa-mobile-alt mr-2 text-success"></i> 0822 1089 8977
                                        </h4>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success" data-dismiss="modal">Kembali</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--end::Portlet-->
        </div>
    </div>
@endsection

@section('footer_scripts')
    <script>
        // Initialize and add the map
        function initMap() {
        // The location of marker
        var marker = {lat: parseFloat(<?php echo $project->latitude; ?>), lng: parseFloat(<?php echo $project->longitude; ?>) };
        // The map, centered at marker
        var map = new google.maps.Map(
            document.getElementById('map'), {
                zoom: 17, 
                center: marker,
                mapTypeId: 'hybrid'
            });
        // The marker, positioned at marker
        var marker = new google.maps.Marker({position: marker, map: map});
        }
    </script>
@endsection