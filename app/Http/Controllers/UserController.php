<?php

namespace App\Http\Controllers;

use App\Models\PropertiModel;
use App\Models\BookingModel;
use App\Models\KonfirmasiModel;
use App\Models\MarketingModel;
use App\Models\PendanaanModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Auth;

class UserController extends Controller
{
    public  $properti,
            $booking,
            $konfirmasi,
            $marketing,
            $pendanaan;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->properti     = New PropertiModel;
        $this->booking      = New BookingModel;
        $this->konfirmasi   = New KonfirmasiModel;
        $this->marketing    = New MarketingModel;
        $this->pendanaan    = New PendanaanModel;
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();

        if ($user->isAdmin()) {
            return view('pages.admin.home');
        }

        return redirect('/');
    }

    public function booking_index()
    {
        $booking    = $this->booking->where('id_user', Auth::user()->id)
        ->with(array(
            'properti'  => function($query){
                $query->select('id','id_project','blok','no_unit','tipe','harga')
                ->with(array(
                    'project'   => function($query){
                        $query->select('id','nama');
                    }
                ));
            },
            'status'    => function($query){
                $query->select('id','text');
            },
            'pendanaan' => function($query){
                $query->select('id','nama');
            },
            'marketing' => function($query){
                $query->select('id','nama');
            }
        ))
        ->orderBy('id','DESC')->paginate(5);

        $data   = [
            'booking'   => $booking
        ];

        return view('pages.user.booking-index')->with($data);
    }

    public function booking_add($id_properti)
    {
        $properti   = $this->properti->where('id',$id_properti)
        ->with(array(
            'nama_tipe' => function($query){
                $query->select('id','text');
            },
            'project'   => function($query){
                $query->select('id','nama','booking_fee');
            }
        ))
        ->first();
        $marketing  = $this->marketing->orderBy('nama','ASC')->get();
        $pendanaan  = $this->pendanaan->orderby('nama','ASC')->get();
        $data   = [
            'properti'      => $properti,
            'marketing'     => $marketing,
            'pendanaan'     => $pendanaan
        ];
        return view('pages.user.booking-form')->with($data);
    }

    public function booking_store(Request $request, $id_properti){

        $request->validate([
            'nama'          => 'required|max:50',
            'alamat'        => 'required',
            'no_hp'         => 'required|max:18',
            'no_ktp'        => 'required|max:16',
            'pendanaan'     => 'required',
            'marketing'     => 'required',
            'referral'      => 'required|max:50',
            'no_hp_referral'=> 'required|max:18',
        ]);

        $booking                    = $this->booking;
        $booking->id_properti       = $id_properti;
        $booking->kode              = 'RHR'.date('ymdhis');
        $booking->nama              = $request->nama;
        $booking->alamat            = $request->alamat;
        $booking->no_hp             = $request->no_hp;
        $booking->no_ktp            = $request->no_ktp;
        $booking->id_pendanaan      = $request->pendanaan;
        $booking->dp                = $request->dp;
        $booking->cicilan           = $request->cicilan;
        $booking->id_marketing      = $request->marketing;
        $booking->nama_referral     = $request->referral;
        $booking->no_hp_referral    = $request->no_hp_referral;
        $booking->tgl_book          = date("Y-m-d H:i:s");
        $booking->tgl_expired       = date("Y-m-d H:i:s", strtotime('+3 hours'));
        $booking->id_status         = 1;
        $booking->id_user           = Auth::user()->id;
        $booking->save();

        $id_booking = $this->booking->where('id_properti',$id_properti)->select('id')->orderBy('id','DESC')->first()->id;

        $this->properti->where('id', $id_properti)
        ->update([
            'id_status'     => 2,
            'id_booking'    => $id_booking
        ]);

        return redirect('/mybooking')->with("success","Booking berhasil disubmit, segera lakukan transfer dan konfirmasi!");
    }

    public function konfirmasi_form($id_booking)
    {
        $booking    = $this->booking->where('id_user', Auth::user()->id)->where('id', $id_booking)
        ->with(array(
            'properti'  => function($query){
                $query->select('id','id_project','blok','no_unit','tipe','harga')
                ->with(array(
                    'project'   => function($query){
                        $query->select('id','nama');
                    }
                ));
            },
            'status'    => function($query){
                $query->select('id','text');
            }
        ))
        ->first();
        
        $data   = [
            'booking'   => $booking
        ];
        
        return view('pages.user.konfirmasi-form')->with($data);
    }

    public function konfirmasi_store(Request $request, $id_booking)
    {

        $request->validate([
            'bank_tujuan'       => 'required|max:30',
            'bank_pengirim'     => 'required|max:30',
            'no_rek_pengirim'   => 'required|max:30',
            'nama_pengirim'     => 'required|max:50',
            'tgl_transfer'      => 'required',
            'jml_transfer'      => 'required|max:30',
            'bukti_transfer'    => 'required|image|max:2048',
        ]);

        $fileName = time().'_'.request()->bukti_transfer->getClientOriginalName();
        $request->bukti_transfer->storeAs('bukti_transfer', $fileName);

        $konf                   = $this->konfirmasi;
        $konf->id_booking       = $id_booking;
        $konf->bank_tujuan      = $request->bank_tujuan;
        $konf->bank_pengirim    = $request->bank_pengirim;
        $konf->no_rek_pengirim  = $request->no_rek_pengirim;
        $konf->nama_pengirim    = $request->nama_pengirim;
        $konf->tgl_transfer     = $request->tgl_transfer;
        $konf->jml_transfer     = str_replace('.','',$request->jml_transfer);
        $konf->bukti_transfer   = $fileName;
        $konf->catatan          = $request->catatan;
        $konf->id_user          = Auth::user()->id;
        $konf->save();

        return redirect('/mybooking')->with('success','Konfirmasi berhasil disubmit!');
    }
}
