<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PropertiModel;
use App\Models\StatusPropertiModel;
use App\Models\BookingModel;
use App\Models\ProjectModel;
use App\Models\TipeRUmahModel;
use App\Models\StatusBookingModel;
use App\Models\KonfirmasiModel;
use App\Models\MarketingModel;
use Illuminate\Support\Facades\Storage;
use Auth;

class AdminController extends Controller
{
    public  $properti,
            $project,
            $tipe_rumah,
            $status_properti,
            $booking,
            $status_booking,
            $konfirmasi,
            $marketing;

    public function __construct()
    {
        $this->properti         = New PropertiModel;
        $this->project          = New ProjectModel;
        $this->tipe_rumah       = New TipeRUmahModel;
        $this->status_properti  = New StatusPropertiModel;
        $this->booking          = New BookingModel;
        $this->status_booking   = New StatusBookingModel;
        $this->konfirmasi       = New KonfirmasiModel;
        $this->marketing        = New MarketingModel;
        $this->middleware('auth');
    }

    public function properti_index(){

        $properti = $this->properti
        ->with(array(
            'project'   => function($query){
                $query->select('id', 'nama');
            },
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
            'status'        => 'required',
            'img_map'       => 'image|max:2048'
        ]);

        $project    = $this->project->where('id',$request->project)->select('nama')->first();
        
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
        if($request->hasFile('img_map')){
            $filename = str_replace(' ','_', $project->nama ) .'_'. $request->blok .'_'. $request->no_unit .'.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('properti', $filename);
            $properti->img_map      = $filename;
        }
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
        $properti   = $this->properti->where('id',$id)->select('id','id_project','blok','no_unit','img_map')
        ->with(array(
            'project'   => function($query){
                $query->select('id','nama');
            }
        ))
        ->first();

        $request->validate([
            'project'       => 'required',
            'blok'          => 'required',
            'no_unit'       => 'required',
            'tipe'          => 'required',
            'jml_lantai'    => 'required',
            'harga'         => 'required',
            'status'        => 'required',
            'img_map'       => 'image|max:2048'
        ]);
        
        if($request->hasFile('img_map')){
            Storage::delete('properti/'.$properti->img_map);
            $filename = str_replace(' ','_', $properti->project->nama ) .'_'. $request->blok .'_'. $request->no_unit .'.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('properti', $filename);
            $this->properti->where('id',$id)
            ->update([
                'img_map'       => $filename,
            ]);
        }

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
        $properti = $this->properti->where('id',$id)->first();
        Storage::delete('properti/'.$properti->img_map);
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
            },
            'user'      => function($query){
                $query->select('id','first_name','last_name');
            },
            'pendanaan' => function($query){
                $query->select('id','nama');
            },
            'marketing' => function($query){
                $query->select('id','nama');
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
            },
            'marketing' => function($query){
                $query->select('id','nama');
            }
        ))
        ->first();
        
        $marketing          = $this->marketing->select('id','nama')->orderBy('nama','ASC')->get();
        $status_booking     = $this->status_booking->orderBy('id','ASC')->get();
        
        $data       = [
            'booking'           => $booking,
            'status_booking'    => $status_booking,
            'marketing'         => $marketing
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
            'id_status'         => $request->id_status,
            'dp'                => $request->dp,
            'cicilan'           => $request->cicilan,
            'id_marketing'      => $request->marketing,
            'nama_referral'     => $request->referral,
            'no_hp_referral'    => $request->no_hp_referral
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
        $konfirmasi     = $this->konfirmasi
        ->with(array(
            'booking'   => function($query){
                $query->select('id','kode','id_properti')
                ->with(array(
                    'properti'  => function($query){
                        $query->select('id','id_project','blok','no_unit')
                        ->with(array(
                            'project'   => function($query){
                                $query->select('id','nama');
                            }
                        ));
                    }
                ));
            }
        ))
        ->orderBy('id', 'DESC')->paginate(10);
        
        $data   = [
            'konfirmasi'       => $konfirmasi
        ];

        return view('pages.admin.konfirmasi-index')->with($data);
    }

    public function konfirmasi_update(Request $request, $id)
    {
        $konfirmasi = $this->konfirmasi->where('id',$id)->select('id','id_booking')
        ->with(array(
            'booking'   => function($query){
                $query->select('id','id_properti','kode','nama')
                ->with(array(
                    'properti'  => function($query){
                        $query->select('id');
                    }
                ));
            }
        ))
        ->first();

        $this->konfirmasi->where('id',$id)
        ->update([
            'id_status' => 1
        ]);

        $this->booking->where('id',$konfirmasi->booking->id)
        ->update([
            'id_status' => 2
        ]);

        $this->properti->where('id',$konfirmasi->booking->properti->id)
        ->update([
            'id_status'     => 3,
            'id_booking'    => $konfirmasi->booking->id
        ]);
        
        return back()->with('success', 'ID Booking '.$konfirmasi->booking->kode.' telah disetujui!');
    }

    public function project_index()
    {
        $project    = $this->project->withCount('total','available','waiting','booked','deal')->orderBy('id','ASC')->paginate(10);
        $data   = [
            'project'   => $project,
        ];
        return view('pages.admin.project-index')->with($data);
    }

    public function project_add()
    {
        return view('pages.admin.project-add-or-edit');
    }

    public function project_store(Request $request)
    {
        $request->validate([
            'nama'          => 'required',
            'lokasi'        => 'required',
            'total_luas'    => 'required',
            'thn_bangun'    => 'required|max:4',
            'img_map'       => 'image|max:2048',
            'img_logo'      => 'image|max:2048'
        ]);

        $project                = $this->project;
        $project->nama          = $request->nama;
        $project->lokasi        = $request->lokasi;
        $project->latitude      = $request->latitude;
        $project->longitude     = $request->longitude;
        $project->total_luas    = $request->total_luas;
        $project->thn_bangun    = $request->thn_bangun;
        if($request->hasFile('img_map')){
            $filename_map = time().'_'.str_replace(' ','_', $request->nama ) .'_map.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('project', $filename_map);
            $project->img_map       = $filename_map;
        }
        if($request->hasFile('img_logo')){
            $filename_logo = time().'_'.str_replace(' ','_', $request->nama ) .'_logo.'. request()->img_logo->getClientOriginalExtension();
            $request->img_logo->storeAs('project', $filename_logo);
            $project->img_logo       = $filename_logo;
        }
        $project->save();

        $id_project = $this->project->select('id')->orderBy('id','DESC')->first()->id;

        return redirect('/project/edit/'.$id_project)->with('success','Project berhasil ditambhan');
    }

    public function project_edit($id)
    {
        $project    = $this->project->where('id',$id)->first();
        $data       = [
            'project'       => $project,
        ];

        return view('pages.admin.project-add-or-edit')->with($data);
    }

    public function project_update(Request $request, $id)
    {
        $project    = $this->project->where('id',$id)->first();

        $request->validate([
            'nama'          => 'required',
            'lokasi'        => 'required',
            'total_luas'    => 'required',
            'thn_bangun'    => 'required|max:4',
            'img_map'       => 'image|max:2048',
            'img_logo'      => 'image|max:2048'
        ]);
        
        if($request->hasFile('img_map')){
            Storage::delete('project/'.$project->img_map);
            $filenma_map = time() .'_'. str_replace(' ','_', $project->nama ) .'_map.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('project', $filenma_map);
            $this->project->where('id',$id)
            ->update([
                'img_map'       => $filenma_map,
            ]);
        }
        if($request->hasFile('img_logo')){
            Storage::delete('project/'.$project->img_logo);
            $filename_logo = time() .'_'. str_replace(' ','_', $project->nama ) .'_logo.'. request()->img_logo->getClientOriginalExtension();
            $request->img_logo->storeAs('project', $filename_logo);
            $this->project->where('id',$id)
            ->update([
                'img_logo'       => $filename_logo,
            ]);
        }

        $this->project->where('id',$id)->update([
            'nama'              => $request->nama,
            'deskripsi'         => $request->deskripsi,
            'lokasi'            => $request->lokasi,
            'latitude'          => $request->latitude,
            'longitude'         => $request->longitude,
            'total_luas'        => $request->total_luas,
            'thn_bangun'        => $request->thn_bangun,
            'spek_pondasi'      => $request->spek_pondasi,
            'spek_dinding'      => $request->spek_dinding,
            'spek_struktur'     => $request->spek_struktur,
            'spek_lantai'       => $request->spek_lantai,
            'spek_kusen'        => $request->spek_kusen,
            'spek_pintu'        => $request->spek_pintu,
            'spek_jendela'      => $request->spek_jendela,
            'spek_rangka_atap'  => $request->spek_rangka_atap,
            'spek_penutup_atap' => $request->spek_penutup_atap,
            'spek_plafond'      => $request->spek_plafond,
            'spek_pintu_km'     => $request->spek_pintu_km,
            'spek_kamar_mandi'  => $request->spek_kamar_mandi,
            'spek_listrik'      => $request->spek_listrik,
            'spek_air'          => $request->spek_air,
            'spek_carport'      => $request->spek_carport,
            'spek_cat'          => $request->spek_cat
        ]);

        if($request->visibility == 1){
            $this->project->where('id',$id)->update([
                'visibility'    => 1,
            ]);
        }else{
            $this->project->where('id',$id)->update([
                'visibility'    => 0,
            ]);
        }

        return back()->with('success','Data project berhasil dirubah!');
    }

    public function marketing_index()
    {
        $marketing  = $this->marketing->orderBy('nama','ASC')->withCount('total_booking','total_booked')->paginate(10);

        $data       = [
            'marketing'     => $marketing
        ];

        return view('pages.admin.marketing-index')->with($data);
    }

    public function marketing_add()
    {
        return view('pages.admin.marketing-add-or-edit');
    }

    public function marketing_store(Request $request)
    {
        $request->validate([
            'nama'      => 'required|max:50',
            'email'     => 'required|max:50|email'
        ]);

        $marketing          = $this->marketing;
        $marketing->nama    = $request->nama;
        $marketing->email   = $request->email;
        $marketing->save();

        return redirect('/marketing')->with('success','Marketing berhasil ditambah!');
    }

    public function marketing_edit($id)
    {
        $marketing      = $this->marketing->where('id',$id)->first();
        $data           = [
            'marketing'     => $marketing
        ];

        return view('pages.admin.marketing-add-or-edit')->with($data);
    }

    public function marketing_update(Request $request, $id)
    {
        $request->validate([
            'nama'      => 'required|max:50',
            'email'     => 'required|max:50|email'
        ]);

        $this->marketing->where('id',$id)->update([
            'nama'      => $request->nama,
            'email'     => $request->email
        ]);

        return back()->with('success','Data Marketing berhasil dirubah!');
    }
}
