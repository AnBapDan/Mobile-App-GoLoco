import { Injectable } from '@nestjs/common';
import { ProfileDto } from './dto';

@Injectable()
export class ProfileService {
    findProfile(id: String) {
        //TODO retrieve entry from db
        return{
            'name': 'Teste',
            'avatar': '',
            'token': 'this_is_the_user_shared_preferences_key',
        };
    }


    createProfile(profile: ProfileDto) {
        //TODO add entry db
        return{
            'key' :'this_is_the_user_shared_preferences_key',
            'profile':{
                'name': profile.name,
                'avatar': 'assets/avatar.png',
                'token': 'this_is_the_user_shared_preferences_key',
            }
        };
    }
}
