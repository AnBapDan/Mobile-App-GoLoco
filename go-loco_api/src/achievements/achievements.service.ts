import { Injectable } from '@nestjs/common';

@Injectable()
export class AchievementsService {
    getAchievements(key: string) {
        return[
            {
                "name": "Pequenos Passos",
                "value": 100,
                "date": "10/11/2022",
                "image":"assets/logo_short.png",
            },
            {
                "name": "Ganhando Ritmo",
                "value": 1000,
                "date": "11/11/2022",
                "image":"assets/logo_short.png",
            },
            {
                "name": "Iniciante",
                "value": 2500,
                "date": '',
                "image":"assets/logo_short.png",
            },
            {
                "name": "Caminhante",
                "value": 5000,
                "date":'',
                "image":"assets/logo_short.png",
            },
            {
                "name": "Maratonista",
                "value": 10000,
                "date":'',
                "image":"assets/logo_short.png",
            },
        ];
    }
}
