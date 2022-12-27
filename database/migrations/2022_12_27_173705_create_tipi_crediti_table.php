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
        Schema::create('TipiCrediti', function (Blueprint $table) {
            $table->string('CodTipoCredito', 100)->primary();
            $table->string('NomeTipoCredito', 300);
            $table->integer('OrdineCredito')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('TipiCrediti');
    }
};
