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

    public function status()
    {
        return $this->hasOne('App\Models\StatusPropertiModel','id','id_status');
    }


}
