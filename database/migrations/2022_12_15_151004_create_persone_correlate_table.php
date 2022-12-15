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
        Schema::create('PersoneCorrelate', function (Blueprint $table) {
            $table->id();
            $table->string('IDPersona', 100);
            $table->string('IDPersonaCorrelata', 100);

            $table->unique(['IDPersona', 'IDPersonaCorrelata']);
            $table->foreign('IDPersona')
                ->references('IDPersona')->on('Persone')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            $table->foreign('IDPersonaCorrelata')
                ->references('IDPersona')->on('Persone')
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
        Schema::dropIfExists('PersoneCorrelate');
    }
};
