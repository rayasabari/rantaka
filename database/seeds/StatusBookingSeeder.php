<?php

use Illuminate\Database\Seeder;

class StatusBookingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('status_booking')->count() == 0){
            DB::table('status_booking')->insert([
                'text'          => 'Unpaid',
            ]);
            DB::table('status_booking')->insert([
                'text'          => 'Paid',
            ]);
            DB::table('status_booking')->insert([
                'text'          => 'Expired',
            ]);
        }
    }
}
