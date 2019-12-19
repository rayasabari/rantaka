<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProjectTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama', 100);
            $table->longText('deskripsi')->nullable();
            $table->longText('fitur')->nullable();
            $table->longText('lokasi')->nullable();
            $table->longText('sekitar_lokasi')->nullable();
            $table->string('latitude',75)->nullable();
            $table->string('longitude',75)->nullable();
            $table->double('total_luas')->nullable();
            $table->string('thn_bangun',4)->nullable();
            $table->string('spek_pondasi',100)->nullable();
            $table->string('spek_dinding',100)->nullable();
            $table->string('spek_struktur',100)->nullable();
            $table->string('spek_lantai',100)->nullable();
            $table->string('spek_kusen',100)->nullable();
            $table->string('spek_pintu',100)->nullable();
            $table->string('spek_jendela',100)->nullable();
            $table->string('spek_rangka_atap',100)->nullable();
            $table->string('spek_penutup_atap',100)->nullable();
            $table->string('spek_plafond',100)->nullable();
            $table->string('spek_pintu_km',100)->nullable();
            $table->string('spek_kamar_mandi',100)->nullable();
            $table->string('spek_listrik',100)->nullable();
            $table->string('spek_air',100)->nullable();
            $table->string('spek_carport',100)->nullable();
            $table->string('spek_cat',100)->nullable();
            $table->string('img_map',50)->nullable();
            $table->string('img_design',50)->nullable();
            $table->string('img_layout',50)->nullable();
            $table->string('img_harga',50)->nullable();
            $table->double('harga_kelebihan_tanah')->nullable();
            $table->double('booking_fee')->nullable();
            $table->integer('visibility')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('project');
    }
}
