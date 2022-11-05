import { Injectable } from '@nestjs/common';

@Injectable()
export class MarkersService {
    getMarkers(key: string) {
        return [
            {  
                "id": "001",
                "name": "DETI",
                "lat": 40.6330811091,
                "lon": -8.65880500925,
                "status": "false",
                "image": "http://deti-cdn.clients.ua.pt/wp-content/uploads/2018/02/P7240001_2.png",
                 "url": "https://www.ua.pt/pt/deti/",
            },
            {  
                "id": "002",
                "name": "Reitoria",
                "lat": 40.63145837117754,
                "lon": -8.657461579120074,
                "status": "false",
                "image": "https://api-assets.ua.pt/v1/image/resizer?imageUrl=https%3A%2F%2Fuaonline.ua.pt%2Fupload%2Fimg%2Fjoua_i_68.jpg&width=1200",
                 "url": "https://www.ua.pt/",
            },
            {  
                "id": "003",
                "name": "ESSUA",
                "lat":  40.62375090283732,
                "lon":  -8.657511259581797,
                "status": "true",
                "image": "https://api-assets.ua.pt/v1/image/resizer?imageUrl=https%3A%2F%2Fapi-assets.ua.pt%2Ffiles%2Fimgs%2F000%2F000%2F891%2Foriginal.jpg&width=1200",
                 "url": "https://www.ua.pt/",
            },
            
            

        ];
    }
}
