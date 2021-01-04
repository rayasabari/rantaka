@extends('layouts.metronic-1.app')

@section('head')
    <title>Properti | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Properti</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
    <a href="{{ url('/properti/add') }}" class="btn btn-label-success btn-bold btn-sm btn-icon-h kt-margin-l-10">
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
                            Master Data
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th class="text-left" style="width: 1%">#</th>
                                <th class="text-left" style="width: 12%">Project</th>
                                <th class="text-center">Unit</th>
                                <th class="text-center">Tipe</th>
                                <th class="text-center">Jumlah Lantai</th>
                                <th class="text-center">Luas Tanah</th>
                                <th class="text-center">Luas Bangunan</th>
                                <th class="text-center" colspan="2" style="width: 10%">Harga</th>
                                <th class="text-center">Status</th>
                                <th class="text-center" style="width: 6%"><i class="flaticon2-settings"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($properti as $p)
                                <tr>
                                    <td class="text-left align-middle">{{ ($properti ->currentPage()-1) * $properti ->perPage() + $loop->index + 1 }}</td>
                                    <td class="text-left align-middle">{{ $p->project->nama }}</td>
                                    <td class="text-center align-middle">{{ $p->blok .' - '. $p->no_unit }}</td>
                                    <td class="text-center align-middle">Tipe {{ $p->nama_tipe->text }}</td>
                                    <td class="text-center align-middle">{{ $p->jml_lantai }} lantai</td>
                                    <td class="text-center align-middle">
                                        {{ $p->luas_tanah }}
                                        @if($p->luas_tanah_lebih != null || $p->luas_tanah_lebih != 0)
                                            <span class="kt-font-success">(+{{ $p->luas_tanah_lebih }})</span>
                                        @endif
                                        m<sup>2</sup>
                                    </td>
                                    <td class="text-center align-middle">{{ $p->luas_bangunan }} m<sup>2</sup></td>
                                    <td class="text-left align-middle">Rp</td>
                                    <td class="text-right align-middle">{{ number_format($p->harga_total,0,',','.') }}</td>
                                    <td class="text-center align-middle">
                                        @if($p->id_status == 1)
                                            <span class="kt-badge kt-badge--success kt-badge--inline kt-badge--pill"><a href="{{ url('/properti/edit/'.$p->id) }}" class="text-white">{{ $p->status->text }}</a></span>
                                        @elseif($p->id_status == 2)
                                            <span class="kt-badge kt-badge--warning kt-badge--inline kt-badge--pill"><a href="{{ url('/properti/edit/'.$p->id) }}" class="text-white">{{ $p->status->text }}</a></span>
                                        @else  
                                            @php 
                                                $nama = $p->booking != null ? $p->booking->nama : 'Manual';
                                                $no_hp = $p->booking != null ? $p->booking->no_hp : 'Superadmin';
                                            @endphp
                                            <span 
                                                class="kt-badge kt-badge--danger kt-badge--inline kt-badge--pill" data-skin="dark" data-toggle="kt-tooltip" data-placement="top" title="" 
                                                data-original-title="{{ $nama .' ('. $no_hp . ')' }}">
                                                <a href="{{ url('/properti/edit/'.$p->id) }}" class="text-white" >{{ $p->status->text }}</a>
                                            </span>
                                        @endif
                                    </td>
                                    <td class="text-center align-middle">
                                        <a href="{{ url('/properti/edit/'.$p->id) }}" class="btn btn-label-info btn-pill btn-sm">
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
                            {{ $properti->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection