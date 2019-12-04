<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use App\Models\PropertiModel;
use App\Models\BookingModel;

class UpdateStatusProperti extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'properti:stok';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $booking = BookingModel::where('id_status', 1)
        ->where('tgl_expired','<', date('Y-m-d H:i:s'))->select('id','id_properti')->get();

        BookingModel::where('id_status', 1)
        ->where('tgl_expired','<', date('Y-m-d H:i:s'))
        ->update([
            'id_status' => 3
        ]);

        foreach($booking as $bk){
            PropertiModel::where('id',$bk->id_properti)
            ->update([
                'id_status' => 1,
                'id_booking' => null
            ]);
        }
    }
}
