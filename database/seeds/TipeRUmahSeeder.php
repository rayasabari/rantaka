<?php

use Illuminate\Database\Seeder;

class TipeRUmahSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('tipe_rumah')->count() == 0){
            DB::table('tipe_rumah')->insert([
                'text'    => '36',
            ]);
            DB::table('tipe_rumah')->insert([
                'text'    => '60',
            ]);
        }
    }
}
