<?php

use Illuminate\Database\Seeder;

class PendanaanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('pendanaan')->count() == 0){
            DB::table('pendanaan')->insert([
                'nama'    => 'Cash Bertahap',
            ]);
            DB::table('pendanaan')->insert([
                'nama'    => 'Cash',
            ]);
            DB::table('pendanaan')->insert([
                'nama'    => 'KPR',
            ]);
        }
    }
}
