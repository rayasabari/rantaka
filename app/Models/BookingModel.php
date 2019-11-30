<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BookingModel extends Model
{
    protected $table = 'booking';

    public function properti()
    {
        return $this->hasOne('App\Models\PropertiModel','id','id_properti');
    }

    public function status()
    {
        return $this->hasOne('App\Models\StatusBookingModel','id','id_status');
    }
}
