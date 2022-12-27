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
        Schema::create('LinkEpisodi', function (Blueprint $table) {
            $table->id();
            $table->uuid('Episodio');
            $table->string('CodTipoPiattaforma', 100);

            $table->foreign('CodTipoPiattaforma')
                ->references('CodTipoPiattaforma')->on('TipiPiattaforma')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('Episodio')
                ->references('uuid')->on('Episodi')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->unique(['Episodio', 'CodTipoPiattaforma']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('LinkEpisodi');
    }
};
