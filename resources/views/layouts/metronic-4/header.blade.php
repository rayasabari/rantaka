<div id="kt_header" class="kt-header  kt-header--fixed " data-ktheader-minimize="on">
    <div class="kt-container ">

        <!-- begin:: Brand -->
        <div class="kt-header__brand   kt-grid__item" id="kt_header_brand">
            <a class="kt-header__brand-logo" href="/">
                <img alt="Logo" src="assets/media/logos/rantaka-text-lg.webp" height="35" class="kt-header__brand-logo-default" />
                <img alt="Logo" src="assets/media/logos/rantaka-text-black-lg.webp" height="25" class="kt-header__brand-logo-sticky" />
            </a>
        </div>

        <!-- end:: Brand -->

        <!-- begin: Header Menu -->
        <button class="kt-header-menu-wrapper-close" id="kt_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
        <div class="kt-header-menu-wrapper kt-grid__item kt-grid__item--fluid" id="kt_header_menu_wrapper">
            <div id="kt_header_menu" class="kt-header-menu kt-header-menu-mobile ">
                <ul class="kt-menu__nav ">
                    <li class="kt-menu__item {{ $page ?? '' == 'home' ? 'kt-menu__item--open' : ''}}">
                        <a href="{{ url('/') }}" class="kt-menu__link"><span class="kt-menu__link-text">Home</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                    </li>
                    <li class="kt-menu__item {{ Request::segment(1) == 'our-project' ? 'kt-menu__item--open' : '' }}">
                        <a href="{{ url('/our-project') }}" class="kt-menu__link"><span class="kt-menu__link-text">Project</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                    </li>
                    {{-- <li class="kt-menu__item {{ Request::segment(1) == 'about-us' ? 'kt-menu__item--open' : '' }}">
                        <a href="{{ url('/about-us') }}" class="kt-menu__link"><span class="kt-menu__link-text">About Us</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                    </li>
                    <li class="kt-menu__item {{ Request::segment(1) == 'contact-us' ? 'kt-menu__item--open' : '' }}">  
                        <a href="{{ url('/contact-us') }}" class="kt-menu__link"><span class="kt-menu__link-text">Contact Us</span><i class="kt-menu__ver-arrow la la-angle-right"></i></a>
                    </li> --}}
                </ul>
            </div>
        </div>
        <!-- end: Header Menu -->

        <!-- begin:: Header Topbar -->
        <div class="kt-header__topbar kt-grid__item">

            <!--begin: User bar -->
            <div class="kt-header__topbar-item kt-header__topbar-item--user">
                @if(Auth::user())
                    <div class="kt-header__topbar-wrapper" data-toggle="dropdown" data-offset="10px,0px">
                        <span class="kt-header__topbar-welcome">Hi,</span>
                        <span class="kt-header__topbar-username">{{ Auth::user()->first_name }}</span>
                        <span class="kt-header__topbar-icon"><b>{{ substr(Auth::user()->first_name,0,1) }}</b></span>
                        {{-- <img alt="Pic" src="assets/media/users/300_21.jpg" class="kt-hidden" /> --}}
                    </div>
                    <div class="dropdown-menu dropdown-menu-fit dropdown-menu-right dropdown-menu-anim dropdown-menu-xl">

                        <!--begin: Head -->
                        <div class="kt-user-card kt-user-card--skin-dark kt-notification-item-padding-x" style="background-image: url(assets/media/misc/bg-1.jpg)">
                            <div class="kt-user-card__avatar">
                                <img class="kt-hidden" alt="Pic" src="assets/media/users/300_25.jpg" />

                                <!--use below badge element instead the user avatar to display username's first letter(remove kt-hidden class to display it) -->
                                <span class="kt-badge kt-badge--lg kt-badge--rounded kt-badge--bold kt-font-success">{{ substr(Auth::user()->first_name,0,1) }}</span>
                            </div>
                            <div class="kt-user-card__name">
                                {{ Auth::user()->first_name .' '. Auth::user()->last_name }}
                            </div>
                            {{-- <div class="kt-user-card__badge">
                                <span class="btn btn-success btn-sm btn-bold btn-font-md">23 messages</span>
                            </div> --}}
                        </div>
                        <!--end: Head -->

                        <!--begin: Navigation -->
                        <div class="kt-notification">
                            <a href="{{ url('/mybooking') }}" class="kt-notification__item">
                                <div class="kt-notification__item-icon">
                                    <i class="flaticon2-open-text-book kt-font-success"></i>
                                </div>
                                <div class="kt-notification__item-details">
                                    <div class="kt-notification__item-title kt-font-bold">
                                        My Booking
                                    </div>
                                    <div class="kt-notification__item-time">
                                        Daftar booking saya
                                    </div>
                                </div>
                            </a>
                            {{-- <a href="custom/apps/user/profile-1/personal-information.html" class="kt-notification__item">
                                <div class="kt-notification__item-icon">
                                    <i class="flaticon2-calendar-3 kt-font-brand"></i>
                                </div>
                                <div class="kt-notification__item-details">
                                    <div class="kt-notification__item-title kt-font-bold">
                                        My Profile
                                    </div>
                                    <div class="kt-notification__item-time">
                                        Account settings and more
                                    </div>
                                </div>
                            </a> --}}
                            <div class="kt-notification__custom kt-space-between">
                                <a target="_blank" class="btn btn-label btn-label-brand btn-sm btn-bold" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Sign Out</a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            </div>
                        </div>

                        <!--end: Navigation -->
                    </div>
                @elseif(Auth::guest())
                    {{-- <span class="kt-header__topbar-username"><a href="/login" class="kt-font-light" >Login</a></span> --}}
                    <div class="kt-header__topbar-wrapper" data-offset="10px,0px">
                        <span class="kt-header__topbar-welcome"><a href="{{ url('/login') }}" class="btn btn-success btn-elevate btn-pill btn-sm" >Login</a></span>
                    </div>
                @endif
            </div>

            <!--end: User bar -->
        </div>

        <!-- end:: Header Topbar -->
    </div>
</div>