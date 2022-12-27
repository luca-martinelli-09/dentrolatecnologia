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
        Schema::create('Crediti', function (Blueprint $table) {
            $table->id('IDCredito');
            $table->uuid('Episodio');
            $table->string('CodTipoCredito', 100);
            $table->integer('OrdineCredito')->default(0);

            $table->foreign('CodTipoCredito')
                ->references('CodTipoCredito')->on('TipiCrediti')
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
        Schema::dropIfExists('Crediti');
    }
};
