import { IsEmail, IsNotEmpty } from "class-validator";

export class ProfileDto{

    @IsNotEmpty()
    name: String;
    
    @IsNotEmpty()
    email: String;


    @IsNotEmpty()
    password: String;

    @IsNotEmpty()
    device_id: String;
}