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
            $table->string('email', 100);
            $table->string('dp', 4);
            $table->string('cicilan', 2);
            $table->dateTime('tgl_book');
            $table->dateTime('tgl_expired');
            $table->integer('id_status');
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
