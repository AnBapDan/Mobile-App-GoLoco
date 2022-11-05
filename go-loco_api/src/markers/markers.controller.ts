import { Controller, Get, Param } from '@nestjs/common';
import { MarkersService } from './markers.service';

@Controller('markers')
export class MarkersController {
    constructor(private markersService : MarkersService){}
    @Get(':key')
    markers(@Param() params){
        return this.markersService.getMarkers(params.key);
    }

}
