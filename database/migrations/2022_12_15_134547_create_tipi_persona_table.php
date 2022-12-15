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
        Schema::create('TipiPersona', function (Blueprint $table) {
            $table->string('CodTipoPersona', 100)->primary();
            $table->string('NomeTipoPersona', 300);
            $table->string('RuoloPersona', 300);
            $table->integer('Priorita')->default(0);
            $table->boolean('NascondiTitolo')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('TipiPersona');
    }
};
