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
        Schema::create('Contatti', function (Blueprint $table) {
            $table->id('IDContatto');
            $table->string('Nome', 300);
            $table->string('Link', 1000);
            $table->string('TestoAlternativo', 300)->nullable();
            $table->string('CodTipoContatto', 100);
            $table->boolean('MostraDescrizione')->default(true);
            $table->boolean('MostraHomepage')->default(true);
            $table->integer('Ordine')->default(0);

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
        Schema::dropIfExists('Contatti');
    }
};
