<!DOCTYPE html>

<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 4 & Angular 8
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<html lang="en">

	<!-- begin::Head -->
	<head>
		<base href="../../../../">
		<meta charset="utf-8" />
		<meta name="description" content="Updates and statistics">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="{{ mix('/css/app.css') }}" rel="stylesheet">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        
		<!--begin::Fonts -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700|Roboto:300,400,500,600,700">

		<!--end::Fonts -->

		<!--begin::Page Vendors Styles(used by this page) -->

		<!--end::Page Vendors Styles -->

		<!--begin::Global Theme Styles(used by all pages) -->

		<!--begin:: Vendor Plugins -->
		<link href="assets-2/plugins/general/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/tether/dist/css/tether.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-datetime-picker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-select/dist/css/bootstrap-select.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/select2/dist/css/select2.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/ion-rangeslider/css/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/nouislider/distribute/nouislider.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/owl.carousel/dist/assets/owl.carousel.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/owl.carousel/dist/assets/owl.theme.default.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/quill/dist/quill.snow.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/summernote/dist/summernote.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/animate.css/animate.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/toastr/build/toastr.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/dual-listbox/dist/dual-listbox.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/morris.js/morris.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/sweetalert2/dist/sweetalert2.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/socicon/css/socicon.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/plugins/line-awesome/css/line-awesome.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/plugins/flaticon/flaticon.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/plugins/flaticon2/flaticon.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/general/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />

		<!--end:: Vendor Plugins -->
		<link href="assets-2/css/style.bundle.css" rel="stylesheet" type="text/css" />

		<!--begin:: Vendor Plugins for custom pages -->
		<link href="assets-2/plugins/custom/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/@fullcalendar/core/main.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/@fullcalendar/daygrid/main.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/@fullcalendar/list/main.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/@fullcalendar/timegrid/main.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-autofill-bs4/css/autoFill.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-fixedcolumns-bs4/css/fixedColumns.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-fixedheader-bs4/css/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-rowgroup-bs4/css/rowGroup.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-scroller-bs4/css/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/datatables.net-select-bs4/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/jstree/dist/themes/default/style.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/jqvmap/dist/jqvmap.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/plugins/custom/uppy/dist/uppy.min.css" rel="stylesheet" type="text/css" />

		<!--end:: Vendor Plugins for custom pages -->

		<!--end::Global Theme Styles -->

		<!--begin::Layout Skins(used by all pages) -->
		<link href="assets-2/css/skins/header/base/light.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/css/skins/header/menu/light.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/css/skins/brand/dark.css" rel="stylesheet" type="text/css" />
		<link href="assets-2/css/skins/aside/dark.css" rel="stylesheet" type="text/css" />

		<!--end::Layout Skins -->
        <link rel="shortcut icon" href="assets-2/media/logos/favicon.ico" />
        @yield('head')
	</head>

	<!-- end::Head -->

	<!-- begin::Body -->
	<body class="kt-quick-panel--right kt-demo-panel--right kt-offcanvas-panel--right kt-header--fixed kt-header-mobile--fixed kt-subheader--enabled kt-subheader--fixed kt-subheader--solid kt-aside--enabled kt-aside--fixed kt-page--loading">

		<!-- begin:: Page -->

		<!-- begin:: Header Mobile -->
		<div id="kt_header_mobile" class="kt-header-mobile  kt-header-mobile--fixed ">
			<div class="kt-header-mobile__logo">
				<a href="index.html">
					<img alt="Logo" src="assets-2/media/logos/logo-light.png" />
				</a>
			</div>
			<div class="kt-header-mobile__toolbar">
				<button class="kt-header-mobile__toggler kt-header-mobile__toggler--left" id="kt_aside_mobile_toggler"><span></span></button>
				<button class="kt-header-mobile__toggler" id="kt_header_mobile_toggler"><span></span></button>
				<button class="kt-header-mobile__topbar-toggler" id="kt_header_mobile_topbar_toggler"><i class="flaticon-more"></i></button>
			</div>
		</div>
        <!-- end:: Header Mobile -->

		<div class="kt-grid kt-grid--hor kt-grid--root">
			<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page">
				<!-- begin:: Aside -->
				<!-- Uncomment this to display the close button of the panel
                <button class="kt-aside-close " id="kt_aside_close_btn"><i class="la la-close"></i></button>
                -->
				<div class="kt-aside  kt-aside--fixed  kt-grid__item kt-grid kt-grid--desktop kt-grid--hor-desktop" id="kt_aside">
					<!-- begin:: Aside -->
					<div class="kt-aside__brand kt-grid__item " id="kt_aside_brand">
						<div class="kt-aside__brand-logo">
							<a href="{{ url('/home') }}">
								<img alt="Logo" src="assets/media/logos/rantaka-text-lg.png" height="30"/>
							</a>
						</div>
						<div class="kt-aside__brand-tools">
							<button class="kt-aside__brand-aside-toggler" id="kt_aside_toggler">
								<span><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<polygon points="0 0 24 0 24 24 0 24" />
											<path d="M5.29288961,6.70710318 C4.90236532,6.31657888 4.90236532,5.68341391 5.29288961,5.29288961 C5.68341391,4.90236532 6.31657888,4.90236532 6.70710318,5.29288961 L12.7071032,11.2928896 C13.0856821,11.6714686 13.0989277,12.281055 12.7371505,12.675721 L7.23715054,18.675721 C6.86395813,19.08284 6.23139076,19.1103429 5.82427177,18.7371505 C5.41715278,18.3639581 5.38964985,17.7313908 5.76284226,17.3242718 L10.6158586,12.0300721 L5.29288961,6.70710318 Z" fill="#000000" fill-rule="nonzero" transform="translate(8.999997, 11.999999) scale(-1, 1) translate(-8.999997, -11.999999) " />
											<path d="M10.7071009,15.7071068 C10.3165766,16.0976311 9.68341162,16.0976311 9.29288733,15.7071068 C8.90236304,15.3165825 8.90236304,14.6834175 9.29288733,14.2928932 L15.2928873,8.29289322 C15.6714663,7.91431428 16.2810527,7.90106866 16.6757187,8.26284586 L22.6757187,13.7628459 C23.0828377,14.1360383 23.1103407,14.7686056 22.7371482,15.1757246 C22.3639558,15.5828436 21.7313885,15.6103465 21.3242695,15.2371541 L16.0300699,10.3841378 L10.7071009,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(15.999997, 11.999999) scale(-1, 1) rotate(-270.000000) translate(-15.999997, -11.999999) " />
										</g>
									</svg></span>
								<span><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1" class="kt-svg-icon">
										<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
											<polygon points="0 0 24 0 24 24 0 24" />
											<path d="M12.2928955,6.70710318 C11.9023712,6.31657888 11.9023712,5.68341391 12.2928955,5.29288961 C12.6834198,4.90236532 13.3165848,4.90236532 13.7071091,5.29288961 L19.7071091,11.2928896 C20.085688,11.6714686 20.0989336,12.281055 19.7371564,12.675721 L14.2371564,18.675721 C13.863964,19.08284 13.2313966,19.1103429 12.8242777,18.7371505 C12.4171587,18.3639581 12.3896557,17.7313908 12.7628481,17.3242718 L17.6158645,12.0300721 L12.2928955,6.70710318 Z" fill="#000000" fill-rule="nonzero" />
											<path d="M3.70710678,15.7071068 C3.31658249,16.0976311 2.68341751,16.0976311 2.29289322,15.7071068 C1.90236893,15.3165825 1.90236893,14.6834175 2.29289322,14.2928932 L8.29289322,8.29289322 C8.67147216,7.91431428 9.28105859,7.90106866 9.67572463,8.26284586 L15.6757246,13.7628459 C16.0828436,14.1360383 16.1103465,14.7686056 15.7371541,15.1757246 C15.3639617,15.5828436 14.7313944,15.6103465 14.3242754,15.2371541 L9.03007575,10.3841378 L3.70710678,15.7071068 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" transform="translate(9.000003, 11.999999) rotate(-270.000000) translate(-9.000003, -11.999999) " />
										</g>
									</svg></span>
							</button>
							<!--
                            <button class="kt-aside__brand-aside-toggler kt-aside__brand-aside-toggler--left" id="kt_aside_toggler"><span></span></button>
                            -->
						</div>
					</div>
					<!-- end:: Aside -->

					<!-- begin:: Aside Menu -->
                    @include('layouts.metronic-1.menu-aside')
					<!-- end:: Aside Menu -->
				</div>
                <!-- end:: Aside -->
                
				<div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper" id="kt_wrapper">

                    <!-- begin:: Header -->
                    @include('layouts.metronic-1.header')
                    <!-- end:: Header -->
                    
					<div class="kt-content  kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor" id="kt_content">
                        
                        <!-- begin:: Content Head -->
						<div class="kt-subheader  kt-grid__item" id="kt_subheader">
							<div class="kt-container  kt-container--fluid ">
								<div class="kt-subheader__main">
                                    @yield('content_head')
								</div>
							</div>
						</div>
						<!-- end:: Content Head -->

						<!-- begin:: Content -->
						<div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid">
							<!--Begin::Dashboard 1-->
                            @yield('content')
							<!--End::Dashboard 1-->
						</div>
                        <!-- end:: Content -->
					</div>

					<!-- begin:: Footer -->
					<div class="kt-footer  kt-grid__item kt-grid kt-grid--desktop kt-grid--ver-desktop" id="kt_footer">
						<div class="kt-container  kt-container--fluid ">
							<div class="kt-footer__copyright">
								{{ date('Y') }}&nbsp;&copy;&nbsp;<a href="http://rantaka.id" target="_blank" class="kt-link">PT Rantaka Haburi Radika</a>
							</div>
							<div class="kt-footer__menu">
								<span>RHR IT Team</span>
							</div>
						</div>
					</div>
					<!-- end:: Footer -->
				</div>
			</div>
		</div>
		<!-- end:: Page -->

		<!-- begin::Scrolltop -->
		<div id="kt_scrolltop" class="kt-scrolltop">
			<i class="fa fa-arrow-up"></i>
		</div>
        <!-- end::Scrolltop -->

        @yield('footer_scripts')

		<!-- begin::Global Config(global config for global JS sciprts) -->
		<script>
			var KTAppOptions = {
				"colors": {
					"state": {
						"brand": "#5d78ff",
						"dark": "#282a3c",
						"light": "#ffffff",
						"primary": "#5867dd",
						"success": "#34bfa3",
						"info": "#36a3f7",
						"warning": "#ffb822",
						"danger": "#fd3995"
					},
					"base": {
						"label": [
							"#c5cbe3",
							"#a1a8c3",
							"#3d4465",
							"#3e4466"
						],
						"shape": [
							"#f0f3ff",
							"#d9dffa",
							"#afb4d4",
							"#646c9a"
						]
					}
				}
			};
		</script>

		<!-- end::Global Config -->

		<!--begin::Global Theme Bundle(used by all pages) -->

		<!--begin:: Vendor Plugins -->
		<script src="assets-2/plugins/general/jquery/dist/jquery.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/popper.js/dist/umd/popper.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js-cookie/src/js.cookie.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/moment/min/moment.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/tooltip.js/dist/umd/tooltip.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/perfect-scrollbar/dist/perfect-scrollbar.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/sticky-js/dist/sticky.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/wnumb/wNumb.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/jquery-form/dist/jquery.form.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/block-ui/jquery.blockUI.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/bootstrap-datepicker.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-datetime-picker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/bootstrap-timepicker.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-maxlength/src/bootstrap-maxlength.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/plugins/bootstrap-multiselectsplitter/bootstrap-multiselectsplitter.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-select/dist/js/bootstrap-select.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-switch/dist/js/bootstrap-switch.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/bootstrap-switch.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/select2/dist/js/select2.full.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/ion-rangeslider/js/ion.rangeSlider.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/typeahead.js/dist/typeahead.bundle.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/handlebars/dist/handlebars.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/inputmask/dist/jquery.inputmask.bundle.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/inputmask/dist/inputmask/inputmask.date.extensions.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/inputmask/dist/inputmask/inputmask.numeric.extensions.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/nouislider/distribute/nouislider.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/owl.carousel/dist/owl.carousel.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/autosize/dist/autosize.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/clipboard/dist/clipboard.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/dropzone/dist/dropzone.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/dropzone.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/quill/dist/quill.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/@yaireo/tagify/dist/tagify.polyfills.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/@yaireo/tagify/dist/tagify.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/summernote/dist/summernote.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/markdown/lib/markdown.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/bootstrap-markdown.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/bootstrap-notify/bootstrap-notify.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/bootstrap-notify.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/jquery-validation/dist/jquery.validate.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/jquery-validation/dist/additional-methods.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/jquery-validation.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/toastr/build/toastr.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/dual-listbox/dist/dual-listbox.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/raphael/raphael.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/morris.js/morris.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/chart.js/dist/Chart.bundle.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/plugins/bootstrap-session-timeout/dist/bootstrap-session-timeout.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/plugins/jquery-idletimer/idle-timer.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/waypoints/lib/jquery.waypoints.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/counterup/jquery.counterup.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/es6-promise-polyfill/promise.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/sweetalert2/dist/sweetalert2.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/js/global/integration/plugins/sweetalert2.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/jquery.repeater/src/lib.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/jquery.repeater/src/jquery.input.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/jquery.repeater/src/repeater.js" type="text/javascript"></script>
		<script src="assets-2/plugins/general/dompurify/dist/purify.js" type="text/javascript"></script>

		<!--end:: Vendor Plugins -->
		<script src="assets-2/js/scripts.bundle.js" type="text/javascript"></script>

		<!--begin:: Vendor Plugins for custom pages -->
		<script src="assets-2/plugins/custom/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/@fullcalendar/core/main.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/@fullcalendar/daygrid/main.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/@fullcalendar/google-calendar/main.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/@fullcalendar/interaction/main.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/@fullcalendar/list/main.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/@fullcalendar/timegrid/main.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/gmaps/gmaps.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/dist/es5/jquery.flot.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/source/jquery.flot.resize.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/source/jquery.flot.categories.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/source/jquery.flot.pie.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/source/jquery.flot.stack.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/source/jquery.flot.crosshair.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/flot/source/jquery.flot.axislabels.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net/js/jquery.dataTables.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-bs4/js/dataTables.bootstrap4.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/js/global/integration/plugins/datatables.init.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-autofill/js/dataTables.autoFill.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-autofill-bs4/js/autoFill.bootstrap4.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jszip/dist/jszip.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/pdfmake/build/pdfmake.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/pdfmake/build/vfs_fonts.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-buttons/js/dataTables.buttons.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-buttons/js/buttons.colVis.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-buttons/js/buttons.flash.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-buttons/js/buttons.html5.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-buttons/js/buttons.print.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-colreorder/js/dataTables.colReorder.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-fixedcolumns/js/dataTables.fixedColumns.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-keytable/js/dataTables.keyTable.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-responsive/js/dataTables.responsive.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-rowgroup/js/dataTables.rowGroup.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-rowreorder/js/dataTables.rowReorder.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-scroller/js/dataTables.scroller.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/datatables.net-select/js/dataTables.select.min.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jstree/dist/jstree.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jqvmap/dist/jquery.vmap.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jqvmap/dist/maps/jquery.vmap.world.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jqvmap/dist/maps/jquery.vmap.russia.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jqvmap/dist/maps/jquery.vmap.usa.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jqvmap/dist/maps/jquery.vmap.germany.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/jqvmap/dist/maps/jquery.vmap.europe.js" type="text/javascript"></script>
		<script src="assets-2/plugins/custom/uppy/dist/uppy.min.js" type="text/javascript"></script>

		<!--end:: Vendor Plugins for custom pages -->

		<!--end::Global Theme Bundle -->

		<!--begin::Page Vendors(used by this page) -->
		<script src="//maps.google.com/maps/api/js?key=AIzaSyBTGnKT7dt597vo9QgeQ7BFhvSRP4eiMSM" type="text/javascript"></script>

		<!--end::Page Vendors -->

		<!--begin::Page Scripts(used by this page) -->
		<script src="assets-2/js/pages/dashboard.js" type="text/javascript"></script>

		<!--end::Page Scripts -->

		<script>
			/* FORMAT ANGKA 3 titik*/
			function angka(objek) {
				objek = typeof(objek) != 'undefined' ? objek : 0;
				a = objek.value;
				b = a.replace(/[^\d]/g, "");
				c = "";
				panjang = b.length;
				j = 0;
				for (i = panjang; i > 0; i--) {
					j = j + 1;
					if (((j % 3) == 1) && (j != 1)) {
						c = b.substr(i - 1, 1) + "." + c;
					} else {
						c = b.substr(i - 1, 1) + c;
					}
				}
				objek.value = c;
			}
		</script>

	</body>

	<!-- end::Body -->
</html>