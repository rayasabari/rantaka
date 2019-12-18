@extends('layouts.metronic-4.app')

@section('head')
    <title>Rantaka | Home</title>
    <style>
        /* Extra small devices (phones, 600px and down) */
        @media only screen and (max-width: 600px) {
            .p-slide {margin-top: -25px;margin-bottom: 20px;}
            .b-book {margin-bottom: 30px;}
            .pict{height: auto;margin-bottom: -5px;}
        }

        /* Small devices (portrait tablets and large phones, 600px and up) */
        @media only screen and (min-width: 600px) {
            .p-slide {margin-top: -25px;margin-bottom: 20px;}
            .b-book {margin-bottom: 30px;}
            .pict{height: auto;margin-bottom: -5px;}
        }

        /* Medium devices (landscape tablets, 768px and up) */
        @media only screen and (min-width: 768px) {
            .p-slide {margin-top: -25px;margin-bottom: 40px;}
            .b-book {margin-bottom: 50px;}
            .pict{height: auto;margin-bottom: -5px;}
        } 

        /* Large devices (laptops/desktops, 992px and up) */
        @media only screen and (min-width: 992px) {
            .p-slide {margin-top: -110px;margin-bottom: 40px;}
            .pict{height: auto;margin-bottom: -5px;}
        } 

        /* Extra large devices (large laptops and desktops, 1200px and up) */
        @media only screen and (min-width: 1200px) {
            .p-slide {margin-top: -110px;margin-bottom: 40px;}
            .pict{height: auto;margin-bottom: -5px}
        }
    </style>
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12 p-slide">
        <div class="slidex shadow-lg">
            @foreach($slider as $s)
                <div class="pict">
                    @if($s->url != null)
                        <a href="{{ $s->url }}">
                            <img src="{{ url('storage/slider/'.$s->nama_file) }}" alt="" width="100%" style="max-height: 630px">
                        </a>
                    @else
                        <img src="{{ url('storage/slider/'.$s->nama_file) }}" alt="" width="100%" style="max-height: 630px">
                    @endif
                </div>
            @endforeach
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-12 text-center b-book">
        <a href="{{ url('our-project/1') }}" class="btn btn-success btn-lg kt-font-bold"><i class="fa fa-tag mr-1"></i> BOOK NOW!</a>
    </div>
</div>
@endsection

@section('footer_scripts')
    <script type="text/javascript">
        $(document).ready(function() {
            $('.slidex').slick({
                dots: true,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 3000,
                fade: true
            });
        });
    </script>
@endsection