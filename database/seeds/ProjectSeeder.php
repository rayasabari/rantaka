<?php

use Illuminate\Database\Seeder;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('project')->count() == 0){
            DB::table('project')->insert([
                'nama'    => 'Green Valley Estate',
            ]);
        }
    }
}
