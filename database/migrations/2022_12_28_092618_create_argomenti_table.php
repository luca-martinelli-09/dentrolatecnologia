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
        Schema::create('Argomenti', function (Blueprint $table) {
            $table->string('CodArgomento', 100)->primary();
            $table->string('NomeArgomento', 300);
            $table->string('ColoreSfondo', 9);
            $table->string('ColoreTesto', 9);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('Argomenti');
    }
};
