@extends('layouts.metronic-4.app')

@section('head')
    <title>Our Projects | Rantaka</title>
@endsection

@section('subheader')
    <h3 class="kt-subheader__title">
        Our Project </h3>
    <div class="kt-subheader__breadcrumbs">
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-home"><i class="flaticon2-shelter"></i></a>
        <a href="{{ url('/') }}" class="kt-subheader__breadcrumbs-link">Home</a>
        <span class="kt-subheader__breadcrumbs-separator"></span>
        <a href="{{ url('/our-project') }}" class="kt-subheader__breadcrumbs-link">Our Project</a>
    </div>
@endsection

@section('content')
    <div class="row">
        @foreach($project as $pr)
            <div class="col-xl-6">
                <!--begin:: Portlet-->
                <div class="kt-portlet kt-portlet--height-fluid">
                    <div class="kt-portlet__body kt-portlet__body--fit">
                        <!--begin::Widget -->
                        <div class="kt-widget kt-widget--project-1">
                            <div class="kt-widget__head">
                                <div class="kt-widget__label">
                                    <div class="kt-widget__media">
                                        <span class="kt-media kt-media--lg kt-media--circle"> 
                                            <img src="{{ url('storage/project/'.$pr->img_design) }}" alt="image">
                                        </span>
                                    </div>
                                    <div class="kt-widget__info kt-margin-t-5">
                                        <a href="#" class="kt-widget__title">
                                            {{ $pr->nama }}                                               
                                        </a>
                                        <span class="kt-widget__desc">
                                            {{ $pr->lokasi }}  
                                        </span>
                                    </div>
                                </div>
                                <div class="kt-portlet__head-toolbar">
                                    <a href="#" class="btn btn-clean btn-sm btn-icon btn-icon-md" data-toggle="dropdown">
                                        <i class="flaticon-more-1"></i>
                                    </a>
                                </div>
                            </div>
        
                            <div class="kt-widget__body">
                                <div class="kt-widget__stats">
                                    <div class="kt-widget__item">
                                        <span class="kt-widget__date">
                                            Total Unit
                                        </span>
                                        <div class="kt-widget__label text-center">
                                            <h4 class="kt-font-brand">{{ $pr->total_count }}</h4>
                                        </div>
                                    </div>
        
                                    <div class="kt-widget__item">
                                        <span class="kt-widget__date">
                                            Booked Unit
                                        </span>
                                        <div class="kt-widget__label text-center">
                                            <h4 class="text-danger">{{ $pr->booked_count }}</h4>
                                        </div>
                                    </div>
        
                                    <div class="kt-widget__item flex-fill">
                                        <span class="kt-widget__subtitel">Tersedia</span>
                                        <div class="kt-widget__progress d-flex  align-items-center">
                                            <div class="progress" style="height: 5px;width: 100%;">
                                                <div class="progress-bar kt-bg-success" role="progressbar" style="width: 20%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <span class="kt-widget__stat">
                                                78%
                                            </span>
                                        </div>
                                    </div>
                                </div>
        
                                <span class="kt-widget__text">
                                    {{ $pr->deskripsi }}                           
                                </span>
        
                                <div class="kt-widget__content">
                                    <div class="kt-widget__details">
                                        <span class="kt-widget__subtitle">Harga Mulai</span>
                                        <span class="kt-widget__value"><span>Rp </span>{{ $pr->total_count == 0 ? '' : number_format($pr->harga_terendah[0]->harga,0,',','.') }}</span>
                                    </div>
        
                                    <div class="kt-widget__details">
                                        <span class="kt-widget__subtitle">Uang Muka Mulai</span>
                                        <span class="kt-widget__value">10 %</span>
                                    </div>
        
                                    <div class="kt-widget__details">
                                        <span class="kt-widget__subtitle">Pendanaan</span>
                                        <div class="widget__value">
                                            @foreach($pendanaan as $pd)
                                                <span class="kt-widget__value">{{ $pd->nama }}</span>
                                            @endforeach
                                        </div>                                 
                                    </div>
                                </div>
                            </div>
        
                            <div class="kt-widget__footer">
                                <div class="kt-widget__wrapper">
                                    <div class="kt-widget__section">
                                        <a href="{{ url('/our-project/'.$pr->id) }}" class="btn btn-brand btn-sm btn-upper btn-bold">details</a>                                 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end::Widget -->
                    </div>
                </div>
                <!--end:: Portlet-->
            </div>
        @endforeach
    </div>
@endsection