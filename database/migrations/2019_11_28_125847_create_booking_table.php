<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('booking', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('id_properti');
            $table->string('kode', 20);
            $table->string('nama', 100);
            $table->longText('alamat');
            $table->string('no_hp', 18);
            $table->string('no_ktp', 16);
            $table->integer('id_pendanaan',1)->nullable();
            $table->string('dp',20)->nullable();
            $table->string('cicilan',20)->nullable();
            $table->integer('id_marketing',3)->nullable();
            $table->string('nama_referral', 100)->nullable();
            $table->string('no_hp_referral',18)->nullable();
            $table->dateTime('tgl_book');
            $table->dateTime('tgl_expired');
            $table->integer('id_status');
            $table->integer('id_user');
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
        Schema::dropIfExists('booking');
    }
}
