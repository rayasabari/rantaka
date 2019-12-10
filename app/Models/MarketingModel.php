<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MarketingModel extends Model
{
    protected  $table = 'marketing';

    public function total_booking()
    {
        return $this->hasMany('App\Models\BookingModel','id_marketing','id');
    }

    public function total_booked()
    {
        return $this->hasMany('App\Models\BookingModel','id_marketing','id')->where('id_status', 2);
    }
}
