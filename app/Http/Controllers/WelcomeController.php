<?php

namespace App\Http\Controllers;

use App\Models\PropertiModel;
use App\Models\StatusPropertiModel;
use App\Models\BookingModel;
use App\Models\ProjectModel;
use App\Models\PendanaanModel;
use App\Models\ImgTipeModel;
use App\Models\TipeRumahModel;
use App\Models\SliderModel;
use App\Http\Controllers\DB;
use Illuminate\Http\Request;
use Auth;

class WelcomeController extends Controller
{
    public  $properti,
            $status_properti,
            $booking,
            $project,
            $pendanaan,
            $tipe_rumah,
            $img_tipe,
            $slider;

    public function __construct()
    {
        $this->properti         = New PropertiModel;
        $this->status_properti  = New StatusPropertiModel;
        $this->booking          = New BookingModel;
        $this->project          = New ProjectModel;
        $this->pendanaan        = New PendanaanModel;
        $this->tipe_rumah       = New TipeRumahModel;
        $this->img_tipe         = New ImgTipeModel;
        $this->slider           = New SliderModel;
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function welcome()
    {
        $page       = 'home';
        $slider     = $this->slider->where('visibility',1)->orderBy('urutan','ASC')->get();

        $data       =   [
            'page'          => $page,
            'slider'        => $slider
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
        $project    = $this->project
        ->where('visibility',1)
        ->select('id','nama','deskripsi','lokasi','total_luas','thn_bangun','img_map','img_logo')
        ->withCount('total','available','booked')
        ->with(array(
            'harga_terendah'    => function($query){
                $query->select('id','id_project','harga')->orderBy('harga','ASC')->first();
            }
        ))
        ->orderBy('id','ASC')->paginate(4);

        $pendanaan  = $this->pendanaan->select('nama')->get();
        
        $data       = [
            'project'   => $project,
            'pendanaan' => $pendanaan
        ];
        return view('pages.our-project')->with($data);
    }

    public function our_project_show($id)
    {
        $project    = $this->project->where('id',$id)
        ->with(array(
            'img_tipe' => function($query){
                $query->select('id','id_project','id_tipe_rumah','kategori','file')->orderBy('id_tipe_rumah','ASC')
                ->with(array(
                    'tipe_rumah'    => function($query){
                        $query->select('id','text');
                    }
                ));
            }
        ))->first();

        $properti   =   $this->properti->where('id_project', $id)
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

        $fitur          = explode(':',$project->fitur);
        $sekitar_lokasi = explode(':',$project->sekitar_lokasi);

        $list_blok  = $this->properti->distinct('blok')->select('blok')->orderBy('blok','ASC')->get();

        $data       = [
            'project'           => $project,
            'properti'          => $properti,
            'list_blok'         => $list_blok,
            'fitur'             => $fitur,
            'sekitar_lokasi'    => $sekitar_lokasi
        ];

        return view('pages.project-details')->with($data);
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
