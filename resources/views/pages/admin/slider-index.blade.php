@extends('layouts.metronic-1.app')

@section('head')
    <title>Slider | Rantaka</title>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('a[data-rel^=lightcase]').lightcase();
        });
    </script>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Slider</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
    <a href="{{ url('/slider/add') }}" class="btn btn-label-success btn-bold btn-sm btn-icon-h kt-margin-l-10">
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
                            Custom Slider 
                            <small>Slideshow untuk halaman Home</small>
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th class="text-left" style="width: 1%">#</th>
                                <th class="text-left" style="width: 13%">Foto</th>
                                <th class="text-left">Judul</th>
                                <th class="text-left">Deskripsi</th>
                                <th class="text-left">Hyperlink</th>
                                <th class="text-center">Urutan</th>
                                <th class="text-center">Visibility</th>
                                <th class="text-center" style="width: 6%"><i class="flaticon2-settings"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($slider as $s)
                                <tr>
                                    <td class="text-left align-middle">{{ ($slider ->currentPage()-1) * $slider ->perPage() + $loop->index + 1 }}</td>
                                    <td class="text-left align-middle">
                                        <a href="{{ url('storage/slider/'.$s->nama_file) }}" data-rel="lightcase" title="{{ $s->nama_file_original }}">
                                            <img src="{{ url('storage/slider/'.$s->nama_file) }}" alt="" height="60px;">
                                        </a>
                                    </td>
                                    <td class="text-left align-middle">{{ $s->judul }}</td>
                                    <td class="text-left align-middle">{{ $s->deskripsi }}</td>
                                    <td class="text-left align-middle">{{ $s->url }}</td>
                                    <td class="text-left align-middle">{{ $s->urutan }}</td>
                                    <td class="text-center align-middle">
                                        @if($s->visibility == 1)
                                            <i class="fa fa-eye kt-font-warning"></i>
                                        @else
                                            <i class="fa fa-eye-slash text-black-50"></i>
                                        @endif
                                    </td>
                                    <td class="text-center align-middle">
                                        <a href="{{ url('/slider/edit/'.$s->id) }}" class="btn btn-label-info btn-pill btn-sm">
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
                            {{ $slider->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
