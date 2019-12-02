<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PropertiModel;
use App\Models\StatusPropertiModel;
use App\Models\BookingModel;
use App\Models\ProjectModel;
use App\Models\TipeRUmahModel;
use App\Models\StatusBookingModel;

class AdminController extends Controller
{
    public  $properti,
            $project,
            $tipe_rumah,
            $status_properti,
            $booking,
            $status_booking;

    public function __construct()
    {
        $this->properti         = New PropertiModel;
        $this->project          = New ProjectModel;
        $this->tipe_rumah       = New TipeRUmahModel;
        $this->status_properti  = New StatusPropertiModel;
        $this->booking          = New BookingModel;
        $this->status_booking   = New StatusBookingModel;
    }

    public function properti_index(){

        $properti   =   $this->properti->where('id_project', 1)
        ->with(array(
            'status'    => function($query){
                $query->select('id', 'text');
            },
            'nama_tipe' => function($query){
                $query->select('id','text');
            },
            'booking'  => function($query){
                $query->select('id','nama','no_hp','tgl_book','tgl_expired');
            }
        ))    
        ->orderBy('id', 'ASC')
        ->paginate(25);

        $data       =   [
        'properti'      => $properti
        ];

        return view('pages.admin.properti-index')->with($data);
    }

    public function properti_add()
    {
        $project        = $this->project->select('id','nama')->orderBy('id', 'ASC')->get();
        $tipe_rumah     = $this->tipe_rumah->select('id','text')->orderBy('id',"ASC")->get();
        $stt_properti   = $this->status_properti->select('id','text')->orderBy('id', 'ASC')->get();
        $data   = [
            'project'           => $project,
            'tipe_rumah'        => $tipe_rumah,
            'stt_properti'      => $stt_properti
        ];

        return view('pages.admin.properti-add-or-edit')->with($data);
    }

    public function properti_store(Request $request)
    {
        $request->validate([
            'project'       => 'required',
            'blok'          => 'required',
            'no_unit'       => 'required',
            'tipe'          => 'required',
            'jml_lantai'    => 'required',
            'harga'         => 'required',
            'status'        => 'required'
        ]);

        $properti                   = $this->properti;
        $properti->id_project       = $request->project;
        $properti->blok             = $request->blok;
        $properti->no_unit          = $request->no_unit;
        $properti->tipe             = $request->tipe;
        $properti->jml_lantai       = $request->jml_lantai;
        $properti->luas_tanah       = $request->luas_tanah;
        $properti->luas_bangunan    = $request->luas_bangunan;
        $properti->harga            = str_replace('.','',$request->harga);
        $properti->id_status        = $request->status;
        $properti->keterangan       = $request->keterangan;
        $properti->save();

        $id = $this->properti->select('id')->orderBy('id', 'DESC')->first()->id;
        return redirect('/properti/edit/'.$id)->with('status','Properti berhasil ditambah!');
    }

    public function properti_edit($id)
    {
        $properti       = $this->properti->where('id', $id)->first();
        $project        = $this->project->select('id','nama')->orderBy('id','ASC')->get();
        $tipe_rumah     = $this->tipe_rumah->select('id','text')->orderBy('id',"ASC")->get();
        $stt_properti   = $this->status_properti->select('id','text')->orderBy('id','ASC')->get();
        $data       = [
            'properti'      => $properti,
            'project'       => $project,
            'tipe_rumah'    => $tipe_rumah,
            'stt_properti'  => $stt_properti
        ];

        return view('pages.admin.properti-add-or-edit')->with($data);
    }

    public function properti_update(Request $request, $id)
    {
        $request->validate([
            'project'       => 'required',
            'blok'          => 'required',
            'no_unit'       => 'required',
            'tipe'          => 'required',
            'jml_lantai'    => 'required',
            'harga'         => 'required',
            'status'        => 'required'
        ]);

        $this->properti->where('id',$id)
        ->update([
            'id_project'    => $request->project,
            'blok'          => $request->blok,
            'no_unit'       => $request->no_unit,
            'tipe'          => $request->tipe,
            'jml_lantai'    => $request->jml_lantai,
            'luas_tanah'    => $request->luas_tanah,
            'luas_bangunan' => $request->luas_bangunan,
            'harga'         => str_replace('.','',$request->harga),
            'id_status'     => $request->status,
            'keterangan'    => $request->keterangan
        ]);
        
        return back()->with('status', 'Data berhasil diupdate!');
    }

    public function properti_destroy($id)
    {
        $this->properti->destroy($id);
        return back()->with('status','Properti berhasil dihapus!'); 
    }

    public function booking_index()
    {
        $booking    = $this->booking
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
        ->orderBy('id','DESC')->paginate(10);
        $data       = [
            'booking'   => $booking
        ];

        return view('pages.admin.booking-index')->with($data);
    }

    public function booking_edit($id)
    {
        $booking    = $this->booking->where('id', $id)
        ->with(array(
            'properti'  => function($query){
                $query->select('id','id_project','blok','no_unit','tipe', 'harga')
                ->with(array(
                    'project'   => function($query){
                        $query->select('id','nama');
                    },
                    'nama_tipe' => function($query){
                        $query->select('id','text');
                    }
                ));
            },
            'status'    => function($query){
                $query->select('id','text');
            }
        ))
        ->first();

        $status_booking    = $this->status_booking->orderBy('id','ASC')->get();
        
        $data       = [
            'booking'           => $booking,
            'status_booking'    => $status_booking
        ];

        return view('pages.admin.booking-edit')->with($data);
    }

    public function booking_update(Request $request, $id)
    {
        $request->validate([
            'id_status' => 'required'
        ]);

        $booking    = $this->booking->where('id', $id)->select('id','id_properti')->first();

        $this->booking->where('id', $id)
        ->update([
            'id_status' => $request->id_status
        ]);

        if($request->id_status == 2){
            $this->properti->where('id', $booking->id_properti)
            ->update([
                'id_status'     => 3,
                'id_booking'    => $id
            ]);
        }elseif($request->id_status == 1){
            $this->properti->where('id', $booking->id_properti)
            ->update([
                'id_status'     => 2,
                'id_booking'    => $id
            ]);
        }else{
            $this->properti->where('id', $booking->id_properti)
            ->update([
                'id_status'     => 1
            ]);
        }

        return back()->with('status', "Booking berhasil diupdate!");
    }

    public function konfrimasi_index()
    {
        return view('pages.admin.konfirmasi-index');
    }

    public function project_index()
    {
        return view('pages.admin.project-index');
    }
}