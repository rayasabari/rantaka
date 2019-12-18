<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSliderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('slider', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nama_file',200)->nullable();
            $table->string('nama_file_original',200)->nullable();
            $table->string('judul',200)->nullable();
            $table->longText('deskripsi')->nullable();
            $table->longText('url')->nullable();
            $table->integer('urutan')->default(0);
            $table->integer('visibility')->nullable()->default(0);
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
        Schema::dropIfExists('slider');
    }
}
