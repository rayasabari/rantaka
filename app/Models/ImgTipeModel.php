<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ImgTipeModel extends Model
{
    protected $table = 'img_tipe';

    public function tipe_rumah()
    {
        return $this->hasOne('App\Models\TipeRumahModel','id','id_tipe_rumah');
    }
}
