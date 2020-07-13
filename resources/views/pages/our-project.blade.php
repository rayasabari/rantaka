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
                                            <img src="{{ url('storage/project/'.$pr->img_map) }}" alt="image">
                                        </span>
                                    </div>
                                    <div class="kt-widget__info kt-margin-t-5">
                                        <a href="{{ url('our-project/'.$pr->id) }}" class="kt-widget__title">
                                            {{ $pr->nama }}                                               
                                        </a>
                                        <span class="kt-widget__desc">
                                            {{ $pr->lokasi }}  
                                        </span>
                                    </div>
                                </div>
                                <div class="kt-portlet__head-toolbar">
                                </div>
                            </div>
                            <div class="kt-widget__body">
                                {{-- <div class="kt-widget__stats">
                                    <div class="kt-widget__item">
                                        <span class="kt-widget__date">
                                            Total Unit
                                        </span>
                                        <div class="kt-widget__label text-center">
                                            <h4 class="kt-font-brand">{{ $pr->total_count }}</h4>
                                        </div>
                                    </div>
                                    @if($pr->booked_count > 20)
                                        <div class="kt-widget__item">
                                            <span class="kt-widget__date">
                                                Booked Unit
                                            </span>
                                            <div class="kt-widget__label text-center">
                                                <h4 class="text-danger">{{ $pr->booked_count }}</h4>
                                            </div>
                                        </div>
                                        <div class="kt-widget__item flex-fill">
                                            <span class="kt-widget__subtitel">Available Unit</span>
                                            <div class="kt-widget__progress d-flex  align-items-center">
                                                <div class="progress" style="height: 5px;width: 100%;">
                                                    <div class="progress-bar kt-bg-success" role="progressbar" style="width: {{ $pr->total_count != 0 ? ($pr->available_count * 100) / $pr->total_count : 0 }}%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                                <span class="kt-widget__stat">
                                                    <span data-skin="dark" data-toggle="kt-tooltip" data-placement="top" title="" data-original-title="{{ $pr->available_count }} Unit">{{ $pr->total_count != 0 ? number_format(($pr->available_count * 100) / $pr->total_count,1,',','.') : 0 }}%</span>
                                                </span>
                                            </div>
                                        </div>
                                    @endif
                                </div> --}}
                                <span class="kt-widget__text">
                                    {{ $pr->deskripsi }}                           
                                </span>
                                <div class="kt-widget__content">
                                    <div class="kt-widget__details" style="width:35%">
                                        <span class="kt-widget__subtitle">Harga Mulai</span>
                                        <span class="kt-widget__value text-warning"><h3><span>Rp </span>{{ $pr->total_count == 0 ? '' : number_format($pr->harga_terendah[0]->harga,0,',','.') }}</span></span>
                                    </div>
                                    <div class="kt-widget__details" style="width:20%">
                                        <span class="kt-widget__subtitle">Uang Muka Mulai</span>
                                        <span class="kt-widget__value text-center text-danger"><h3>10 %</h3></span>
                                    </div>
                                    <div class="kt-widget__details" style="width:20%">
                                        <span class="kt-widget__subtitle text-center">Total Unit</span>
                                        <span class="kt-widget__value text-center text-success"><h3>{{ $pr->total_count }}</h3></span>
                                    </div>
                                    {{-- <div class="kt-widget__details" style="width:25%">
                                        <span class="kt-widget__subtitle">Pendanaan</span>
                                        <div class="widget__value">
                                            @foreach($pendanaan as $pd)
                                            <i class="fa fa-check-double mr-2 text-success"></i><span class="kt-widget__value">{{ $pd->nama }}</span><br>
                                            @endforeach
                                        </div>                                 
                                    </div> --}}
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
    <div class="row">
        <div class="col-lg-12">
            <div class="kt-pagination kt-pagination--success mt-3 mb-2">
                <p class="kt-section__desc"></p>
                <div class="kt-pagination__toolbar">
                    {{ $project->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection