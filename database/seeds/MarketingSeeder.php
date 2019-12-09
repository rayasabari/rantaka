<?php

use Illuminate\Database\Seeder;

class MarketingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('marketing')->count() == 0){
            DB::table('marketing')->insert([
                'nama'    => 'Elfira Pranda',
            ]);
            DB::table('marketing')->insert([
                'nama'    => 'Pamela Ribka',
            ]);
            DB::table('marketing')->insert([
                'nama'    => 'Emilia Loman',
            ]);
        }
    }
}
