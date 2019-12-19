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
use App\Models\ImgTipeModel;
use App\Models\SliderModel;
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
            $img_tipe,
            $marketing,
            $slider;

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
        $this->img_tipe         = New ImgTipeModel;
        $this->slider           = New SliderModel;
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
        $project        = $this->project->select('id','nama','harga_kelebihan_tanah')->orderBy('id', 'ASC')->get();
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
        
        $properti                           = $this->properti;
        $properti->id_project               = $request->project;
        $properti->blok                     = $request->blok;
        $properti->no_unit                  = $request->no_unit;
        $properti->id_tipe_rumah            = $request->tipe;
        $properti->jml_lantai               = $request->jml_lantai;
        $properti->luas_tanah               = $request->luas_tanah;
        $properti->luas_tanah_lebih         = $request->luas_tanah_lebih;
        $properti->luas_bangunan            = $request->luas_bangunan;
        $properti->harga                    = str_replace('.','',$request->harga);
        $properti->harga_kelebihan_tanah    = str_replace('.','',$request->harga_kelebihan_tanah);
        $properti->harga_total              = str_replace('.','',$request->harga_total);
        $properti->id_status                = $request->status;
        if($request->hasFile('img_map')){
            $filename = time().'_'.str_replace(' ','_', $project->nama ) .'_'. $request->blok .'_'. $request->no_unit .'.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('properti', $filename);
            $properti->img_map              = $filename;
        }
        $properti->keterangan               = $request->keterangan;
        $properti->save();

        $id = $this->properti->select('id')->orderBy('id', 'DESC')->first()->id;
        return redirect('/properti/edit/'.$id)->with('status','Properti berhasil ditambah!');
    }

    public function properti_edit($id)
    {
        $properti       = $this->properti->where('id', $id)
                            ->with(array(
                                'project'   => function($query){
                                    $query->select('id','harga_kelebihan_tanah');
                                }
                            ))
                            ->first();
        $project        = $this->project->select('id','nama','harga_kelebihan_tanah')->orderBy('id','ASC')->get();
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
            $filename = time().'_'.str_replace(' ','_', $properti->project->nama ) .'_'. $request->blok .'_'. $request->no_unit .'.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('properti', $filename);
            $this->properti->where('id',$id)
            ->update([
                'img_map'       => $filename,
            ]);
        }

        $this->properti->where('id',$id)
        ->update([
            'id_project'            => $request->project,
            'blok'                  => $request->blok,
            'no_unit'               => $request->no_unit,
            'id_tipe_rumah'         => $request->tipe,
            'jml_lantai'            => $request->jml_lantai,
            'luas_tanah'            => $request->luas_tanah,
            'luas_tanah_lebih'      => $request->luas_tanah_lebih,
            'luas_bangunan'         => $request->luas_bangunan,
            'harga'                 => str_replace('.','',$request->harga),
            'harga_kelebihan_tanah' => str_replace('.','',$request->harga_kelebihan_tanah),
            'harga_total'           => str_replace('.','',$request->harga_total),
            'id_status'             => $request->status,
            'keterangan'            => $request->keterangan
        ]);
        
        return back()->with('status', 'Data berhasil diupdate!');
    }

    public function properti_destroy($id)
    {
        $properti = $this->properti->where('id',$id)->first();
        Storage::delete('properti/'.$properti->img_map);
        $this->properti->destroy($id);
        return redirect('/properti')->with('status','Properti berhasil dihapus!'); 
    }

    public function booking_index()
    {
        $booking    = $this->booking
        ->with(array(
            'properti'  => function($query){
                $query->select('id','id_project','blok','no_unit','id_tipe_rumah','harga')
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
                $query->select('id','id_project','blok','no_unit','id_tipe_rumah', 'harga')
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
            'img_logo'      => 'image|max:2048',
            'img_harga'     => 'image|max:2048'
        ]);

        $project                        = $this->project;
        $project->nama                  = $request->nama;
        $project->lokasi                = $request->lokasi;
        $project->latitude              = $request->latitude;
        $project->longitude             = $request->longitude;
        $project->total_luas            = $request->total_luas;
        $project->thn_bangun            = $request->thn_bangun;
        $project->harga_kelebihan_tanah = str_replace('.','',$request->harga_kelebihan_tanah);
        $project->booking_fee           = str_replace('.','',$request->booking_fee);
        $project->visibility            = $request->visibility;
        if($request->hasFile('img_map')){
            $filename_map = time().'_'.str_replace(' ','_', $request->nama ) .'_map.'. request()->img_map->getClientOriginalExtension();
            $request->img_map->storeAs('project', $filename_map);
            $project->img_map       = $filename_map;
        }
        if($request->hasFile('img_logo')){
            $filename_logo = time().'_'.str_replace(' ','_', $request->nama ) .'_logo.'. request()->img_logo->getClientOriginalExtension();
            $request->img_logo->storeAs('project', $filename_logo);
            $project->img_logo      = $filename_logo;
        }
        if($request->hasFile('img_harga')){
            $file_name_harga = time().'_'.str_replace(' ','_', $request->nama ) .'_harga.'. request()->img_harga->getClientOriginalExtension();
            $request->img_harga->storeAs('project', $file_name_harga);
            $project->img_harga     = $file_name_harga;
        }
        $project->save();

        $id_project = $this->project->select('id')->orderBy('id','DESC')->first()->id;

        return redirect('/project/edit/'.$id_project)->with('success','Project berhasil ditambhan');
    }

    public function project_edit($id)
    {
        $project        = $this->project->where('id',$id)->first();
        $tipe_rumah     = $this->tipe_rumah->select('id','text')->orderBy('text')->get();
        $img_tipe       = $this->img_tipe->where('id_project',$id)
        ->with(array(
            'tipe_rumah'    => function($query){
                $query->select('id','text');
            }
        ))->orderBy('id_tipe_rumah','ASC')
        ->get();

        $kategori       = [
            ['text' =>  'Design'],
            ['text' =>  'Layout']
        ];

        $data           = [
            'project'       => $project,
            'tipe_rumah'    => $tipe_rumah,
            'kategori'      => $kategori,
            'img_tipe'      => $img_tipe
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
            'img_logo'      => 'image|max:2048',
            'img_harga'     => 'image|max:2048'
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

        if($request->hasFile('img_harga')){
            Storage::delete('project/'.$project->img_harga);
            $filename_harga = time() .'_'. str_replace(' ','_', $project->nama ) .'_harga.'. request()->img_harga->getClientOriginalExtension();
            $request->img_harga->storeAs('project', $filename_harga);
            $this->project->where('id',$id)
            ->update([
                'img_harga'       => $filename_harga,
            ]);
        }

        $this->project->where('id',$id)->update([
            'nama'                  => $request->nama,
            'deskripsi'             => $request->deskripsi,
            'lokasi'                => $request->lokasi,
            'latitude'              => $request->latitude,
            'longitude'             => $request->longitude,
            'total_luas'            => $request->total_luas,
            'thn_bangun'            => $request->thn_bangun,
            'spek_pondasi'          => $request->spek_pondasi,
            'spek_dinding'          => $request->spek_dinding,
            'spek_struktur'         => $request->spek_struktur,
            'spek_lantai'           => $request->spek_lantai,
            'spek_kusen'            => $request->spek_kusen,
            'spek_pintu'            => $request->spek_pintu,
            'spek_jendela'          => $request->spek_jendela,
            'spek_rangka_atap'      => $request->spek_rangka_atap,
            'spek_penutup_atap'     => $request->spek_penutup_atap,
            'spek_plafond'          => $request->spek_plafond,
            'spek_pintu_km'         => $request->spek_pintu_km,
            'spek_kamar_mandi'      => $request->spek_kamar_mandi,
            'spek_listrik'          => $request->spek_listrik,
            'spek_air'              => $request->spek_air,
            'spek_carport'          => $request->spek_carport,
            'spek_cat'              => $request->spek_cat,
            'harga_kelebihan_tanah' => str_replace('.','',$request->harga_kelebihan_tanah),
            'booking_fee'           => str_replace('.','',$request->booking_fee),
            'visibility'            => $request->visibility
        ]);

        return back()->with('success','Data project berhasil dirubah!');
    }

    public function project_destroy($id)
    {
        $project    = $this->project->where('id',$id)->select('id','img_map','img_logo','img_harga')->withCount('img_tipe')->first();
        $img_tipe   = $this->img_tipe->where('id_project',$id)->select('id','id_project','file')->get();

        if($project->img_tipe_count > 0){
            foreach($img_tipe as $it){
                Storage::delete('project/'.$it->file);
            }
        }

        Storage::delete('project/'.$project->img_map);
        Storage::delete('project/'.$project->img_logo);
        Storage::delete('project/'.$project->img_harga);

        $this->project->destroy($id);
        $this->img_tipe->where('id_project', $id)->delete();
        
        return back()->with('success','Project berhasil dihapus!');
    }

    public function project_img_tipe_upload(Request $request, $id)
    {
        $project    = $this->project->where('id',$id)->select('id','nama')->first();
        $request->validate([
            'tipe_rumah'    => 'required',
            'kategori'      => 'required',
            'img_tipe'      => 'required|image|max:2048'
        ]);

        $filename = time() .'_'. str_replace(' ','_', $project->nama ) .'_'.$request->kategori. '_'. $request->tipe_rumah .'.'. request()->img_tipe->getClientOriginalExtension();
        $request->img_tipe->storeAs('project', $filename);

        $img_tipe                   = $this->img_tipe;
        $img_tipe->id_project       = $id;
        $img_tipe->id_tipe_rumah    = $request->tipe_rumah;
        $img_tipe->kategori         = $request->kategori;
        $img_tipe->file             = $filename;
        $img_tipe->save();

        return back()->with('success','Foto berhasil ditambah!');
    }

    public function project_img_tipe_destroy($id)
    {
        $img_tipe   = $this->img_tipe->where('id',$id)->select('id','file')->first();
        Storage::delete('project/'.$img_tipe->file);
        $this->img_tipe->destroy($id);

        return back()->with('success','Foto berhasil dihapus!');
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

    public function slider_index()
    {
        $slider     = $this->slider->orderBy('id','DESC')->paginate(10);
        $data       = [
            'slider'    => $slider
        ];

        return view('pages.admin.slider-index')->with($data);
    }

    public function slider_add()
    {
        return view('pages.admin.slider-add-or-edit');
    }

    public function slider_store(Request $request)
    {
        $request->validate([
            'urutan'        => 'required',
            'img_slider'    => 'required|image|max:4096'
        ]);

        $filename           = time().'_'. str_replace(' ','_', request()->img_slider->getClientOriginalName());
        $original_filename  = str_replace(' ','_', request()->img_slider->getClientOriginalName());
        $request->img_slider->storeAs('slider', $filename);

        $slider                     = $this->slider;
        $slider->nama_file          = $filename;
        $slider->nama_file_original = $original_filename;
        $slider->judul              = $request->judul;
        $slider->deskripsi          = $request->deskripsi;
        $slider->url                = $request->url;
        $slider->urutan             = $request->urutan;
        $slider->visibility         = $request->visibility;
        $slider->save();

        return redirect('/slider')->with('success','Slider berhasil ditambah!');
    }

    public function slider_edit($id)
    {
        $slider     = $this->slider->where('id',$id)->first();
        $data       = [
            'slider'    => $slider
        ];
        return view('pages.admin.slider-add-or-edit')->with($data);
    }

    public function slider_update(Request $request, $id)
    {
        $request->validate([
            'urutan'            => 'required',
            'img_slider'        => 'image|max:4096'
        ]);
        
        $slider     = $this->slider->where('id',$id)->select('id','nama_file')->first();
        if($request->hasFile('img_slider')){
            Storage::delete('slider/'.$slider->nama_file);
            $filename           = time().'_'. str_replace(' ','_', request()->img_slider->getClientOriginalName());
            $original_filename  = str_replace(' ','_', request()->img_slider->getClientOriginalName());
            $request->img_slider->storeAs('slider', $filename);
            $this->slider->where('id',$id)
            ->update([
                'nama_file'             => $filename,
                'nama_file_original'    => $original_filename
            ]);
        }

        $this->slider->where('id',$id)
        ->update([
            'judul'         => $request->judul,
            'deskripsi'     => $request->deskripsi,
            'url'           => $request->url,
            'urutan'        => $request->urutan,
            'visibility'    => $request->visibility
        ]);

        return back()->with('success','Slider berhasil diupdate!');
    }

    public function slider_destroy($id)
    {
        $slider = $this->slider->where('id',$id)->select('id','nama_file')->first();
        Storage::delete('slider/'.$slider->nama_file);

        $this->slider->destroy($id);

        return redirect('/slider')->with('success', 'Slider berhasil dihapus!');
    }
}
