<?php

namespace Database\Seeders;

use App\Models\LinkPodcast;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LinkPodcastSeeder extends Seeder {
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run() {
        $linksPodcast = [
            ['https://open.spotify.com/show/6XkOjGpx6SP32cTeLYxI35', 'spotify', 0, true],
            ['https://podcasts.apple.com/it/podcast/insider-dentro-la-tecnologia/id1492761030', 'applepodcast', 1, true],
            ['https://podcasts.google.com/?feed=aHR0cHM6Ly93d3cuZGVudHJvbGF0ZWNub2xvZ2lhLml0L3Jzcw%3D%3D', 'googlepodcast', 2, true],
            ['https://music.amazon.it/podcasts/8e710ac0-36ad-412f-9942-12e2cfc256df/insider---dentro-la-tecnologia', 'amazonmusic', 3, true],
            ['https://www.youtube.com/channel/UCZIZ6SBbZp_RLzqKxEXdd8w', 'youtube', 4, true],
            ['https://www.spreaker.com/show/insider-dentrolatecnologia', 'spreaker', 5, false],
        ];

        foreach ($linksPodcast as $linkPodcast) {
            try {
                LinkPodcast::create([
                    'Link' => $linkPodcast[0],
                    'CodTipoPiattaforma' => $linkPodcast[1],
                    'Ordine' => $linkPodcast[2],
                    'MostraHomepage' => $linkPodcast[3],
                ]);
            } catch (\Throwable $th) {
                echo "Cannot add LinkPodcast: $linkPodcast[0]\n";
            }
        }
    }
}
