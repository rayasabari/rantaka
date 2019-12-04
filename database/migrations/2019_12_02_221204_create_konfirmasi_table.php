<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKonfirmasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('konfirmasi', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('id_booking');
            $table->string('bank_tujuan', 30);
            $table->string('bank_pengirim', 50);
            $table->string('no_rek_pengirim', 20);
            $table->string('nama_pengirim', 50);
            $table->date('tgl_transfer');
            $table->double('jml_transfer');
            $table->string('bukti_transfer');
            $table->longText('catatan')->nullable();
            $table->integer('id_user');
            $table->integer('status',1)->nullable();
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
        Schema::dropIfExists('konfirmasi');
    }
}
