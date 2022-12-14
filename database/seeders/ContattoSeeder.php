<?php

namespace Database\Seeders;

use App\Models\Contatto;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ContattoSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $contatti = [
            ['Sito web', 'https://www.dentrolatecnologia.it', 'www.dentrolatecnologia.it', 'website', false, false, 0],
            ['Instagram', 'https://instagram.com/dentrolatecnologia', 'Instagram (@dentrolatecnologia)', 'instagram', true, true, 1],
            ['Telegram', 'https://t.me/dentrolatecnologia', 'Telegram (@dentrolatecnologia)', 'telegram', true, true, 2],
            ['Twitter', 'https://twitter.com/insiderdlt', 'Twitter (@insiderdlt)', 'twitter', false, true, 3],
            ['Email (Redazione)', 'mailto:redazione@dentrolatecnologia.it', 'redazione@dentrolatecnologia.it', 'email', true, true, 4],
            ['Facebook', 'https://www.facebook.com/dentrolatecnologia', 'Facebook (@dentrolatecnologia)', 'facebook', false, false, 5],
        ];

        foreach ($contatti as $i => $contatto) {
            try {
                Contatto::create([
                    'IDContatto' => ($i + 1),
                    'Nome' => $contatto[0],
                    'Link' => $contatto[1],
                    'TestoAlternativo' => $contatto[2],
                    'CodTipoContatto' => $contatto[3],
                    'MostraDescrizione' => $contatto[4],
                    'MostraHomepage' => $contatto[5],
                    'Ordine' => $contatto[6],
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add Contatto: $contatto[0]\n";
            }
        }
    }
}
