<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KonfirmasiModel extends Model
{
    protected $table = 'konfirmasi';

    public function booking()
    {
        return $this->hasOne('App\Models\BookingModel','id','id_booking');
    }
    
}
