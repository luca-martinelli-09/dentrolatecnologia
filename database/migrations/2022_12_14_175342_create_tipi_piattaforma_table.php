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
        Schema::create('TipiPiattaforma', function (Blueprint $table) {
            $table->string('CodTipoPiattaforma', 100)->primary();
            $table->string('NomePiattaforma', 300);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('TipiPiattaforma');
    }
};
