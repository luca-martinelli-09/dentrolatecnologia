<?php

namespace Database\Seeders;

use App\Models\TipoPersona;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TipoPersonaSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $tipiPersona = [
            ['autori', 'Redazione', 'Autore', 0, false],
            ['collaboratori', 'Collaboratori', 'Collaboratore', 1, true],
            ['ospiti', 'Ospiti', 'Ospite', 2, false],
            ['ospiti-amici', 'Ospiti', 'Ospite', 3, true],
            ['aziende', 'Aziende', 'Azienda', 4, false],
        ];

        foreach ($tipiPersona as $tipoPersona) {
            try {
                TipoPersona::create([
                    'CodTipoPersona' => $tipoPersona[0],
                    'NomeTipoPersona' => $tipoPersona[1],
                    'RuoloPersona' => $tipoPersona[2],
                    'Priorita' => $tipoPersona[3],
                    'NascondiTitolo' => $tipoPersona[4],
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add TipoPersona: $tipoPersona[0]\n";
            }
        }
    }
}
