<?php

namespace Database\Seeders;

use App\Models\Argomento;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ArgomentoSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $argomenti = [
            ['alimentazione', 'Alimentazione', '#52de97', '#000000'],
            ['ambiente', 'Ambiente', '#a7e9af', '#000000'],
            ['applicazioni', 'Applicazioni', '#4dd599', '#000000'],
            ['arte-cultura', 'Arte & Cultura', '#ffffff', '#000000'],
            ['assistenti', 'Assistenti virtuali', '#ffac8e', '#000000'],
            ['automobili', 'Automobili', '#eb4559', '#ffffff'],
            ['batterie', 'Batterie', '#f4e04d', '#000000'],
            ['blockchain', 'Blockchain', '#f7ea00', '#000000'],
            ['cinema', 'Cinema', '#00818a', '#ffffff'],
            ['computer', 'Computer', '#745c97', '#ffffff'],
            ['cuffie', 'Cuffie', '#f7be16', '#000000'],
            ['diritto', 'Diritto', '#f5dea3', '#000000'],
            ['domotica', 'Domotica', '#723881', '#ffffff'],
            ['energia', 'Energia', '#f1fa3c', '#000000'],
            ['finanza', 'Finanza', '#d4d7dd', '#000000'],
            ['fitness', 'Fitness', '#6fb98f', '#ffffff'],
            ['gaming', 'Gaming', '#c70039', '#ffffff'],
            ['giornalismo', 'Giornalismo', '#ffffff', '#000000'],
            ['ia', 'Intelligenza Artificiale', '#342ead', '#ffffff'],
            ['innovazione', 'Innovazione', '#ff8ba7', '#000000'],
            ['internet', 'Internet', '#3fc5f0', '#000000'],
            ['istruzione', 'Istruzione', '#f08a5d', '#000000'],
            ['materiali', 'Materiali', '#ecce6d', '#000000'],
            ['medicina', 'Medicina', '#b2ebf2', '#000000'],
            ['musica', 'Musica', '#f4efd3', '#000000'],
            ['privacy', 'Privacy', '#ffffff', '#000000'],
            ['retemobile', 'Rete Mobile', '#ffffff', '#000000'],
            ['servizi', 'Servizi', '#ffdbc5', '#000000'],
            ['sicurezza', 'Sicurezza', '#1089ff', '#ffffff'],
            ['smartphone', 'Smartphone', '#dcd6f7', '#000000'],
            ['social', 'Social', '#46b3e6', '#ffffff'],
            ['spazio', 'Spazio', '#110133', '#ffffff'],
            ['tablet', 'Tablet', '#d597ce', '#000000'],
            ['trasporti', 'Trasporti', '#da2d2d', '#ffffff'],
            ['tv', 'TV', '#413c69', '#ffffff'],
        ];

        foreach ($argomenti as $argomento) {
            try {
                Argomento::create([
                    'CodArgomento' => $argomento[0],
                    'NomeArgomento' => $argomento[1],
                    'ColoreSfondo' => $argomento[2],
                    'ColoreTesto' => $argomento[3],
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add Argomento: $argomento[0]\n";
            }
        }
    }
}
