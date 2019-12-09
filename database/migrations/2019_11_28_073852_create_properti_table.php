<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePropertiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('properti', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('id_project');
            $table->string('blok', 2)->nullable();
            $table->string('no_unit', 5)->nullable();
            $table->string('tipe', 20)->nullable();
            $table->integer('jml_lantai')->nullable();
            $table->integer('luas_tanah')->nullable();
            $table->integer('luas_bangunan')->nullable();
            $table->double('harga')->nullable();
            $table->integer('id_status')->nullable();
            $table->integer('id_booking')->nullable();
            $table->longText('keterangan')->nullable();
            $table->string('img_map',50)->nullable();
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
        Schema::dropIfExists('properti');
    }
}
