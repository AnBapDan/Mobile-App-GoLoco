import { Controller, Get, Param } from '@nestjs/common';
import { AchievementsService } from './achievements.service';

@Controller('achievements')
export class AchievementsController {
    constructor(private achievementsService : AchievementsService){}

    @Get(':key')
    markers(@Param() params){
        return this.achievementsService.getAchievements(params.key);
    }
}
