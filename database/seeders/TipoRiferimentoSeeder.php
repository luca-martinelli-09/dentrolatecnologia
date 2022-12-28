<?php

namespace Database\Seeders;

use App\Models\TipoRiferimento;
use Illuminate\Database\Seeder;

class TipoRiferimentoSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $tipiRiferimenti = [
            ['chiacchierata', 'Chiacchierata', false],
            ['intervista', 'Intervista', false],
            ['notizia', 'Notizia', false],
            ['topic', 'Topic', false],
            ['domanda', 'Domanda', true],
            ['capitolo', 'Capitolo', true],
        ];

        foreach ($tipiRiferimenti as $tipoRiferimento) {
            try {
                TipoRiferimento::create([
                    'CodTipoRiferimento' => $tipoRiferimento[0],
                    'NomeRiferimento' => $tipoRiferimento[1],
                    'SottoIndice' => $tipoRiferimento[2],
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add TipoRiferimento: $tipoRiferimento[0]\n";
            }
        }
    }
}
