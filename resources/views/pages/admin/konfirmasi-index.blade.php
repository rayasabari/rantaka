@extends('layouts.metronic-1.app')

@section('head')
    <title>Konfirmasi | Rantaka</title>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Konfirmasi</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">Index</span>
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
                            Daftar Konfirmasi
                        </h3>
                    </div>
                </div>
                <div class="kt-portlet__body">
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th style="width: 1%">#</th>
                                <th class="text-left" style="width: 10%">Kode Booking</th>
                                <th class="text-left" style="width: 8%">Bank Tujuan</th>
                                <th class="text-left" style="width: 8%">Bank Pengirim</th>
                                <th class="text-left" style="width: 12%">No. Rekening Pengirim</th>
                                <th class="text-left">Nama Pengirim</th>
                                <th class="text-left" style="width: 12%">Tanggal Transfer</th>
                                <th class="text-center" colspan="2" style="width:10%">Jumlah Transfer</th>
                                <th class="text-center">Bukti Transfer</th>
                                <th class="text-left">Catatan</th>
                                <th class="text-center">Status</th>
                                <th class="text-center" style="width: 8%"><i class="flaticon2-settings"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($konfirmasi as $k)
                                <tr>
                                    <td class="text-center align-middle">{{ ($konfirmasi ->currentPage()-1) * $konfirmasi ->perPage() + $loop->index + 1 }}</td>
                                    <td class="text-left align-middle">{{ $k->booking->kode }}</td>
                                    <td class="text-left align-middle">{{ $k->bank_tujuan }}</td>
                                    <td class="text-left align-middle">{{ $k->bank_pengirim }}</td>
                                    <td class="text-left align-middle">{{ $k->no_rek_pengirim }}</td>
                                    <td class="text-left align-middle">{{ $k->nama_pengirim }}</td>
                                    <td class="text-left align-middle">{{ date('d F Y', strtotime($k->tgl_transfer)) }}</td>
                                    <td class="text-left align-middle">Rp</td>
                                    <td class="text-right align-middle">{{ number_format($k->jml_transfer,0,',','.') }}</td>
                                    <td class="text-center align-middle">
                                        <a href="{{ url('storage/bukti_transfer/'.$k->bukti_transfer) }}" target="_blank" class="kt-font-danger">
                                            <i class="fa fa-download mr-2"></i>Download 
                                        </a>
                                    </td>
                                    <td class="text-left align-middle">{{ $k->catatan }}</td>
                                    <td class="text-center align-middle">
                                        @if($k->id_status == 1)
                                            <span class="kt-badge kt-badge--success kt-badge--inline kt-badge--pill">Approved</span>
                                        @else  
                                            <span class="kt-badge kt-badge--warning text-white kt-badge--inline kt-badge--pill">Waiting</span>
                                        @endif
                                    </td>
                                    <td class="text-center align-middle">
                                        @if($k->id_status == 1)
                                            <button class="btn btn-label-primary btn-pill btn-sm" disabled>
                                                Approve
                                            </button>
                                        @else
                                            <form method="post" action="{{ url('/konfirmasi/approve/'.$k->id) }}" class="d-inline">
                                                @csrf
                                                <button type="submit" class="btn btn-label-primary btn-pill btn-sm" data-skin="dark" data-toggle="kt-tooltip" data-placement="top" title="" data-original-title="Approve?">
                                                    Approve
                                                </button>
                                            </form>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="kt-pagination kt-pagination--success mt-3 mb-2">
                        <p class="kt-section__desc"></p>
                        <div class="kt-pagination__toolbar">
                            {{ $konfirmasi->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
@endsection

@section('footer_scripts')
    <script>
        $("#approve").click(function(){
            Swal.fire({
                title: 'Yakin Cang?',
                text: "Kalu udah yakin klik Yes cang!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes!'
            }).then((result) => {
                if (result.value) {
                        Swal.fire(
                        'Approved!',
                        'Konfirmasi sukses cang!',
                        'success'
                    )
                }
            })
        });
    </script>
@endsection