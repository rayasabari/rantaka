<?php

use Illuminate\Database\Seeder;

class StatusPropertiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('status_properti')->count() == 0){
            DB::table('status_properti')->insert([
                'text'          => 'Available',
            ]);
            DB::table('status_properti')->insert([
                'text'          => 'Waiting',
            ]);
            DB::table('status_properti')->insert([
                'text'          => 'Booked',
            ]);
        }
    }
}
