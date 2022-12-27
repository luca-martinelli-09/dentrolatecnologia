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
        Schema::create('TokenAccesso', function (Blueprint $table) {
            $table->uuid();
            $table->uuid('Episodio');
            $table->dateTime('DataScadenza');

            $table->foreign('Episodio')
                ->references('uuid')->on('Episodi')
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
        Schema::dropIfExists('TokenAccesso');
    }
};
