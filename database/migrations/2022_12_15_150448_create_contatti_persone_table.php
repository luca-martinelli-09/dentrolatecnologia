<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('ContattiPersone', function (Blueprint $table) {
            $table->id();
            $table->string('IDPersona', 100);
            $table->string('Nome', 300);
            $table->string('Link', 700);
            $table->string('CodTipoContatto', 100);

            $table->foreign('CodTipoContatto')
                ->references('CodTipoContatto')->on('TipiContatto')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('ContattiPersone');
    }
};
