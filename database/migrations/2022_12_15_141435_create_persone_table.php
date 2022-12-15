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
        Schema::create('Persone', function (Blueprint $table) {
            $table->string('IDPersona', 100);
            $table->string('Nome', 300);
            $table->string('Cognome', 300)->nullable();
            $table->string('Biografia', 1000)->nullable();
            $table->string('RuoloPersona', 1000)->nullable();
            $table->string('CodTipoPersona', 100);

            $table->foreign('CodTipoPersona')
                ->references('CodTipoPersona')->on('TipiPersona')
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
        Schema::dropIfExists('Persone');
    }
};
