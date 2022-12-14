<?php

namespace Database\Seeders;

use App\Models\TipoPiattaforma;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TipoPiattaformaSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $tipoPiattaforma = [
            'spotify' => 'Spotify',
            'applepodcast' => 'Apple Podcast',
            'googlepodcast' => 'Google Podcast',
            'amazonmusic' => 'Amazon Music',
            'youtube' => 'YouTube',
            'spreaker' => 'Spreaker',
        ];

        foreach ($tipoPiattaforma as $id => $name) {
            try {
                TipoPiattaforma::create([
                    'CodTipoPiattaforma' => $id,
                    'NomePiattaforma' => $name,
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add TipoPiattaforma: $id\n";
            }
        }
    }
}
