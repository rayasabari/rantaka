@extends('layouts.metronic-1.app')

@php $act = Request::segment(2); @endphp

@section('head')
    <title>{{ ucwords($act) }} Properti | Rantaka</title>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $('a[data-rel^=lightcase]').lightcase();
        });
    </script>
@endsection

@section('content_head')
    <h3 class="kt-subheader__title">Properti</h3>
    <span class="kt-subheader__separator kt-subheader__separator--v"></span>
    <span class="kt-subheader__desc">{{ ucwords($act) }}</span>
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
            <div class="kt-portlet">
                <div class="kt-portlet__head">
                    <div class="kt-portlet__head-label">
                        <h3 class="kt-portlet__head-title">{{ ucwords($act) }} Properti</h3>
                    </div>
                    <div class="kt-portlet__head-toolbar">
                        @if($act == 'edit')
                            <div class="kt-portlet__head-wrapper">
                                <form method="post" action="{{ url('/properti/delete/'.$properti->id) }}" class="d-inline">
                                    @method('delete')
                                    @csrf
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        Delete
                                    </button>
                                </form>
                            </div>
                        @endif
                    </div>
                </div>
                <form class="kt-form kt-form--label-right" method="post" action="{{ $act == 'add' ? url('/properti/add') : url('/properti/edit/'.$properti->id) }}" enctype="multipart/form-data">
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="kt-section kt-section--first">
                            <div class="kt-section__body">
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Project</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select id="project" class="form-control @error('project') is-invalid @enderror" name="project">
                                            <option data-hrg="0" value="">- Pilih -</option>
                                            @foreach($project as $p)
                                                <option data-hrg="{{ $p->harga_kelebihan_tanah }}" value="{{ $p->id}}" @if($act == 'edit') {{ $properti->id_project == $p->id ? 'selected' : '' }} @else {{ old('project') == $p->id ? 'selected' : '' }} @endif>{{ $p->nama }}</option>
                                            @endforeach
                                        </select>
                                        @error('project')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror
                                        <input hidden type="text" id="hkt" value="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Blok</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('blok') is-invalid @enderror" name="blok" type="text" value="{{ $act == 'edit' ? old('blok', $properti->blok) : old('blok') }}">
                                        @error('blok')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror  
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">No. Unit</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('no_unit') is-invalid @enderror" name="no_unit" type="text" value="{{ $act == 'edit' ? old('no_unit', $properti->no_unit) : old('no_unit') }}">
                                        @error('no_unit')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Tipe Rumah</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select class="form-control @error('tipe') is-invalid @enderror" name="tipe">
                                            <option value="">- Pilih -</option>
                                            @foreach($tipe_rumah as $tr)
                                                <option value="{{ $tr->id }}" @if($act == 'edit') {{ $properti->id_tipe_rumah == $tr->id ? 'selected' : '' }} @else {{ old('tipe') == $tr->id ? 'selected' : '' }} @endif>{{ $tr->text }}</option>
                                            @endforeach
                                        </select>
                                        @error('tipe')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Jumlah Lantai</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <input class="form-control @error('jml_lantai') is-invalid @enderror" name="jml_lantai" type="number" value="{{ $act == 'edit' ? old('jml_lantai', $properti->jml_lantai) : old('jml_lantai') }}">
                                        @error('jml_lantai')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Luas Tanah</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <input type="number" step="any" name="luas_tanah" class="form-control" value="{{ $act == 'edit' ? old('luas_tanah', number_format($properti->luas_tanah,1,'.',',')) : old('luas_tanah') }}" placeholder="" aria-describedby="basic-addon1">
                                            <div class="input-group-prepend"><span class="input-group-text">m<sup>2</span></div>
                                        </div>
                                        @error('luas_tanah')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Luas Tanah Lebih</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <input id="ltl" type="number" step="any" name="luas_tanah_lebih" class="form-control" value="{{ $act == 'edit' ? old('luas_tanah_lebih', number_format($properti->luas_tanah_lebih,1,'.',',')) : old('luas_tanah_lebih') }}" placeholder="" aria-describedby="basic-addon1">
                                            <div class="input-group-prepend"><span class="input-group-text">m<sup>2</span></div>
                                        </div>
                                        <span class="form-text text-muted">
                                            biaya kelebihan tanah per m<sup>2</sup> = <strong>Rp <span id="hkt_txt"></span></strong>
                                        </span>
                                        @error('luas_tanah_lebih')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Luas Bangunan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <input type="number" step="any" name="luas_bangunan" class="form-control" value="{{ $act == 'edit' ? old('luas_bangunan', number_format($properti->luas_bangunan,1,'.',',')) : old('luas_bangunan') }}" placeholder="" aria-describedby="basic-addon1">
                                            <div class="input-group-prepend"><span class="input-group-text">m<sup>2</span></div>
                                        </div>
                                        @error('luas_bangunan')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Harga</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                            <input id="harga" type="text" name="harga" onkeyup="angka(this)" onblur="angka(this)" class="form-control font-weight-bold" value="{{ $act == 'edit' ? old('harga', number_format($properti->harga,0,',','.')) : old('harga') }}" placeholder="" aria-describedby="basic-addon1">
                                        </div>
                                        @error('harga')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Harga Luasan Lebih</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                            <input id="hll" readonly type="text" name="harga_kelebihan_tanah" onkeyup="angka(this)" onblur="angka(this)" class="form-control font-weight-bold" value="{{ $act == 'edit' ? old('harga_kelebihan_tanah', number_format($properti->harga_kelebihan_tanah,0,',','.')) : old('harga_kelebihan_tanah') }}" placeholder="" aria-describedby="basic-addon1">
                                        </div>
                                        @error('harga_kelebihan_tanah')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Total Harga</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend"><span class="input-group-text">Rp</div>
                                            <input id="harga_total" readonly type="text" name="harga_total" class="form-control font-weight-bold" value="{{ $act == 'edit' ? old('harga_total', number_format($properti->harga_total,0,',','.')) : old('harga_total') }}" placeholder="" aria-describedby="basic-addon1">
                                        </div>
                                        @error('harga_total')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Status</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <select class="form-control @error('status') is-invalid @enderror" name="status">
                                            <option value="">- Pilih -</option>
                                            @foreach($stt_properti as $sp)
                                                <option value="{{ $sp->id }}" @if($act == 'edit') {{ $properti->id_status == $sp->id ? 'selected' : '' }} @else {{ old('status') == $sp->id ? 'selected' : '' }} @endif>{{ $sp->text }}</option>
                                            @endforeach
                                        </select>
                                        @error('status')
                                            <div class="invalid-feedback">{{ $message }}</div>
                                        @enderror 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Map Lokasi Unit</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <div class="custom-file">
                                            <input name="img_map" type="file" class="custom-file-input text-left @error('img_map') is-invalid @enderror" id="img_map">
                                            <label class="custom-file-label" for="customFile">Pilih file</label>
                                            @if($act == 'edit' && $properti->img_map != null)
                                                <div class="kt-avatar kt-avatar--outline kt-avatar--circle- mt-4" id="kt_user_edit_avatar">
                                                    <a href="{{ url('storage/properti/'.$properti->img_map) }}" data-rel="lightcase" title="Lokai Unit">
                                                        <div class="kt-avatar__holder" style="background-image: url('storage/properti/{{ $properti->img_map }}');"></div>
                                                    </a>
                                                </div>
                                            @endif
                                            @error('img_map')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-xl-3 col-lg-3 col-form-label">Keterangan</label>
                                    <div class="col-lg-9 col-xl-6">
                                        <textarea class="form-control" name="keterangan">{{ $act == 'edit' ? old('keterangan', $properti->keterangan) : old('keterangan') }}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="kt-portlet__foot">
                        <div class="kt-form__actions">
                            <div class="row">
                                <div class="col-lg-3 col-xl-3">
                                </div>
                                <div class="col-lg-9 col-xl-9">
                                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;
                                    <a href="{{ url('/properti') }}" class="btn btn-secondary">Kembali</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('footer_scripts')
    <script>
        $(document).ready(function(){
            get_hkt_m2();
            calc_hkt();
            calc_harga_total();

            $('#project').change(function(){
                get_hkt_m2();
                calc_harga_total()
                if($(this).val() == ''){
                    $('#hll').val(0);
                    $('#harga_total').val(0);
                }
            });
            
            $('#ltl, #harga').keyup(function(){
                calc_hkt();
                calc_harga_total();
            });

            function get_hkt_m2(){
                var hrg = $('#project').find(':selected').data('hrg');
                $('#hkt').val(hrg);
                $('#hkt_txt').text(addCommas(hrg));
            }

            function calc_hkt(){
                var ltl = $('#ltl').val();
                var hkt = $('#hkt').val();
                var hll = ltl * hkt;
                $('#hll').val(addCommas(hll));
            }

            function calc_harga_total(){
                var hrg     = $('#harga').val();
                var hll     = $('#hll').val();
                var a       = hrg.split('.').join('');
                var b       = hll.split('.').join('');
                var thrg    = parseInt(a) + parseInt(b);
                $('#harga_total').val(addCommas(thrg));
            }
        });
    </script>
@endsection