@extends('layouts.metronic-4.app')

@section('head')
	<title>Status Page | Rantaka</title>
@endsection

@section('content')
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				@if (session('success'))
					<div class="alert alert-success">
						{{ session('status') }}
					</div>
				@endif
				@if (session('error'))
					<div class="alert alert-danger">
						{{ session('gagal') }}
					</div>
				@endif
			</div>
		</div>
	</div>
@endsection