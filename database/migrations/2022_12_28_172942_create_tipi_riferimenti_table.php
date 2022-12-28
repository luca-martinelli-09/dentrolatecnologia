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
        Schema::create('TipiRiferimenti', function (Blueprint $table) {
            $table->string('CodTipoRiferimento', 100)->primary();
            $table->string('NomeRiferimento', 300);
            $table->boolean('SottoIndice')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('TipiRiferimenti');
    }
};
