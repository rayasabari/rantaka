<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PropertiModel extends Model
{
    protected $table = 'properti';

    public function project()
    {
        return $this->hasOne('App\Models\ProjectModel','id','id_project');
    }

    public function nama_tipe()
    {
        return $this->hasOne('App\Models\TipeRumahModel','id','tipe');
    }

    public function status()
    {
        return $this->hasOne('App\Models\StatusPropertiModel','id','id_status');
    }

    public function booking()
    {
        return $this->hasOne('App\Models\BookingModel','id','id_booking');
    }

    public function img_tipe()
    {
        return $this->hasMany('App\Models\ImgTipeModel','id_project','id');
    }

}
