<?php

namespace Database\Seeders;

use App\Models\TipoCredito;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TipoCreditoSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $tipiCredito = [
            ['brani', 'Brani', 0],
            ['immagini', 'Immagini', 1],
        ];

        foreach ($tipiCredito as $tipoCredito) {
            try {
                TipoCredito::create([
                    'CodTipoCredito' => $tipoCredito[0],
                    'NomeTipoCredito' => $tipoCredito[1],
                    'OrdineCredito' => $tipoCredito[2],
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add TipoCredito: $tipoCredito[0]\n";
            }
        }
    }
}
