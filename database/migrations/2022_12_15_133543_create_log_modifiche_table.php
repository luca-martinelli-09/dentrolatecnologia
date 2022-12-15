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
        Schema::create('LogModifiche', function (Blueprint $table) {
            $table->id('IDModifica');
            $table->integer('IDAmministratore')->nullable();
            $table->string('DettagliModifica', 1000);
            $table->timestamp('OrarioModifica')->useCurrent();

            $table->foreign('IDAmministratore')
                ->references('IDAmministratore')->on('Amministratori')
                ->onDelete('set null')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('LogModifiche');
    }
};
