<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProjectModel extends Model
{
    protected $table = 'project';

    public function total()
    {
        return $this->hasMany('App\Models\PropertiModel','id_project','id');
    }

    public function available()
    {
        return $this->hasMany('App\Models\PropertiModel','id_project','id')->where('id_status', 1);
    }

    public function waiting()
    {
        return $this->hasMany('App\Models\PropertiModel','id_project','id')->where('id_status', 2);
    }

    public function booked()
    {
        return $this->hasMany('App\Models\PropertiModel','id_project','id')->where('id_status', 3);
    }

    public function deal()
    {
        return $this->hasMany('App\Models\PropertiModel','id_project','id')->where('id_status', 4);
    }

    public function harga_terendah()
    {
        return $this->hasMany('App\Models\PropertiModel','id_project','id');
    }

    public function img_tipe()
    {
        return $this->hasMany('App\Models\ImgTipeModel','id_project','id');
    }

}
