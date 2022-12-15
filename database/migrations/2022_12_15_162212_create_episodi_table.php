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
        Schema::create('Episodi', function (Blueprint $table) {
            $table->uuid('IDEpisodio');
            $table->integer('Stagione');
            $table->integer('Episodio');
            $table->string('Titolo', 255);
            $table->string('Descrizione', 2000);
            $table->string('Tags', 700)->nullable();
            $table->integer('AudioDuration')->default(0);
            $table->integer('AudioSize')->default(0);
            $table->dateTime('DataPubblicazione')->useCurrent();
            $table->boolean('Replica')->default(false);

            $table->unique(['Stagione', 'Episodio']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('Episodi');
    }
};
