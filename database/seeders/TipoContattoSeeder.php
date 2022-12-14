<?php

namespace Database\Seeders;

use App\Models\TipoContatto;
use Illuminate\Database\Seeder;

class TipoContattoSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $tipoContatto = [
            'email' => 'Email',
            'website' => 'Sito web',
            'telegram' => 'Telegram',
            'instagram' => 'Instagram',
            'twitter' => 'Twitter',
            'facebook' => 'Facebook',
            'linkedin' => 'Linkedin',
        ];

        foreach ($tipoContatto as $id => $name) {
            try {
                TipoContatto::create([
                    'CodTipoContatto' => $id,
                    'NomeTipoContatto' => $name,
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add TipoContatto: $id\n";
            }
        }
    }
}
