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
        Schema::create('Repliche', function (Blueprint $table) {
            $table->uuid();
            $table->uuid('Replica');

            $table->foreign('uuid')
                ->references('uuid')->on('Episodi')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('Replica')
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
        Schema::dropIfExists('Repliche');
    }
};
