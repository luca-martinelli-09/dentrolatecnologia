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
        Schema::create('LinksPodcast', function (Blueprint $table) {
            $table->string('Link', 1000);
            $table->string('CodTipoPiattaforma', 100)->primary();
            $table->integer('Ordine')->default(0);
            $table->boolean('MostraHomepage')->default(true);

            $table->foreign('CodTipoPiattaforma')
                ->references('CodTipoPiattaforma')->on('TipiPiattaforma')
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
        Schema::dropIfExists('LinksPodcast');
    }
};
