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

    public function user()
    {
        return $this->hasOne('App\Models\User','id','id_user');
    }

    public function pendanaan()
    {
        return $this->hasOne('App\Models\PendanaanModel','id','id_pendanaan');
    }

    public function marketing()
    {
        return $this->hasOne('App\Models\MarketingModel','id','id_marketing');
    }
}
