<?php

use Illuminate\Database\Seeder;

class PropertiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if(DB::table('properti')->count() == 0){
            $a = 1;
            for($i= 1; $i < 19; $i++){
                DB::table('properti')->insert([
                    'id_project'    => 1,
                    'blok'          => 'A',
                    'no_unit'       => $a,
                    'tipe'          => '30',
                    'jml_lantai'    => 1,
                    'luas_tanah'    => 60,
                    'luas_bangunan' => 30,
                    'id_status'     => 1,
                    'harga'         => 279000000
                ]);
                $a++;
            }
            $b = 1;
            for($i= 19; $i < 37; $i++){
                DB::table('properti')->insert([
                    'id_project'    => 1,
                    'blok'          => 'B',
                    'no_unit'       => $b,
                    'tipe'          => '30',
                    'jml_lantai'    => 1,
                    'luas_tanah'    => 60,
                    'luas_bangunan' => 30,
                    'id_status'     => 1,
                    'harga'         => 279000000
                ]);
                $b++;
            }
            $c = 1;
            for($i= 37; $i < 53; $i++){
                DB::table('properti')->insert([
                    'id_project'    => 1,
                    'blok'          => 'C',
                    'no_unit'       => $c,
                    'tipe'          => '30',
                    'jml_lantai'    => 1,
                    'luas_tanah'    => 60,
                    'luas_bangunan' => 30,
                    'id_status'     => 1,
                    'harga'         => 279000000
                ]);
                $c++;
            }
            $d = 1;
            for($i= 53; $i < 83; $i++){
                DB::table('properti')->insert([
                    'id_project'    => 1,
                    'blok'          => 'D',
                    'no_unit'       => $d,
                    'tipe'          => '30',
                    'jml_lantai'    => 1,
                    'luas_tanah'    => 60,
                    'luas_bangunan' => 30,
                    'id_status'     => 1,
                    'harga'         => 279000000
                ]);
                $d++;
            }
            $e = 1;
            for($i= 83; $i < 90; $i++){
                DB::table('properti')->insert([
                    'id_project'    => 1,
                    'blok'          => 'E',
                    'no_unit'       => $e,
                    'tipe'          => '30',
                    'jml_lantai'    => 1,
                    'luas_tanah'    => 60,
                    'luas_bangunan' => 30,
                    'id_status'     => 1,
                    'harga'         => 279000000
                ]);
                $e++;
            }
            $f = 1;
            for($i= 90; $i < 109; $i++){
                DB::table('properti')->insert([
                    'id_project'    => 1,
                    'blok'          => 'F',
                    'no_unit'       => $f,
                    'tipe'          => '60',
                    'jml_lantai'    => 1,
                    'luas_tanah'    => 60,
                    'luas_bangunan' => 60,
                    'id_status'     => 1,
                    'harga'         => 385000000
                ]);
                $f++;
            }
        }
    }
}
