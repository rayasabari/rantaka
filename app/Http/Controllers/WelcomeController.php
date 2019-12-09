<?php

namespace App\Http\Controllers;

use App\Models\PropertiModel;
use App\Models\StatusPropertiModel;
use App\Models\BookingModel;
use Illuminate\Http\Request;
use Auth;

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
            },
            'nama_tipe' => function($query){
                $query->select('id', 'text');
            },
            'booking'   => function($query){
                $query->select('id','tgl_expired');
            }
        ))    
        ->orderBy('id', 'ASC')
        ->get();

        $list_blok = $this->properti->distinct('blok')->select('blok')->orderBy('blok','ASC')->get();

        $data       =   [
            'page'          => $page,
            'properti'      => $properti,
            'list_blok'     => $list_blok
        ];

        return view('index')->with($data);
    }

    public function refresh_stock()
    {
        $booking = $this->booking->where('id_status', 1)
        ->where('tgl_expired','<', date('Y-m-d H:i:s'))->select('id','id_properti','tgl_expired')->get();

        $this->booking->where('id_status', 1)
        ->where('tgl_expired','<', date('Y-m-d H:i:s'))
        ->update([
            'id_status' => 3
        ]);

        foreach($booking as $bk){
            $this->properti->where('id',$bk->id_properti)
            ->update([
                'id_status' => 1,
                'id_booking' => null
            ]);
        }

        $count = $booking->count();

        // return $booking; die;

        return back()->with('success', $count. ' data updated!');
    }

    public function our_project_index()
    {
        return view('pages.our-project');
    }

    public function about_us_index()
    {
        return view('pages.about-us');
    }

    public function contact_us_index()
    {
        return view('pages.contact-us');
    }

}
