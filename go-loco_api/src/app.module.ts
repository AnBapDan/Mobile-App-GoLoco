import { Module } from '@nestjs/common';
import { ProfileModule } from './profile/profile.module';
import { AchievementsModule } from './achievements/achievements.module';
import { MarkersModule } from './markers/markers.module';

@Module({
  imports: [ProfileModule, AchievementsModule, MarkersModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
