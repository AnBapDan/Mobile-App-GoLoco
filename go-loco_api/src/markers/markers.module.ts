import { Module } from '@nestjs/common';
import { MarkersController } from './markers.controller';
import { MarkersService } from './markers.service';

@Module({
  controllers: [MarkersController],
  providers: [MarkersService]
})
export class MarkersModule {}
