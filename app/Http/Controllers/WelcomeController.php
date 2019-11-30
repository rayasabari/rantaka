<?php

namespace App\Http\Controllers;

use App\Models\PropertiModel;
use App\Models\StatusPropertiModel;
use App\Models\BookingModel;
use Illuminate\Http\Request;

class WelcomeController extends Controller
{
    public  $properti,
            $status_properti,
            $booking;

    public function __construct()
    {
        $this->properti         = New PropertiModel;
        $this->status_properti  = New StatusPropertiModel;
        $this->booking          = New BookingModel;
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function welcome()
    {
        $page       =   'home';
        $properti   =   $this->properti->where('id_project', 1)
                        ->with(array(
                            'status'    => function($query){
                                $query->select('id', 'text');
                            }
                        ))    
                        ->orderBy('id', 'ASC')
                        ->paginate(10);

        $data       =   [
            'page'          => $page,
            'properti'      => $properti
        ];

        return view('index')->with($data);
    }

    public function booking_store(Request $request, $id_properti){

        $request->validate([
            'nama'      => 'required|max:100',
            'alamat'    => 'required',
            'no_hp'     => 'required|max:18',
            'email'     => 'required|max:100',
            'dp'        => 'required',
            'cicilan'   => 'required',
        ]);

        $booking                    = $this->booking;
        $booking->id_properti       = $id_properti;
        $booking->kode              = 'RHR'.date('ymdhis');
        $booking->nama              = $request->nama;
        $booking->alamat            = $request->alamat;
        $booking->no_hp             = $request->no_hp;
        $booking->email             = $request->email;
        $booking->dp                = $request->dp;
        $booking->cicilan           = $request->cicilan;
        $booking->tgl_book          = date("Y-m-d H:i:s");
        $booking->tgl_expired       = date("Y-m-d H:i:s", strtotime('+3 hours'));
        $booking->id_status         = 1;
        $booking->save();

        $this->properti->where('id', $id_properti)
        ->update([
            'id_status' => 2
        ]);

        return back()->with("status","Booking berhasil disubmit, segera lakukan transfer dan konfirmasi!");
    }
}
