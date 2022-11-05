import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { ProfileDto } from './dto';
import { ProfileService } from './profile.service';

@Controller('profile')
export class ProfileController {
    constructor(private profileservice: ProfileService){}


    @Post('create_account')
    createProfile(@Body() profile : ProfileDto){

        console.log(profile);
        return this.profileservice.createProfile(profile);
    }

    
    @Get('key/:id')
    findProfile(@Param() params){
        return this.profileservice.findProfile(params.id);
    }
}
