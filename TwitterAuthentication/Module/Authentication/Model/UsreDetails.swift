//
//  UsreDetails.swift
//  TwitterAuthentication
//
//  Created by Chirag Vekariya on 21/12/21.
//

import Foundation

struct UserDetails: Codable {
    
    let results: [UserInfo]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([UserInfo].self, forKey: .results)
    }
    
}

struct UserInfo: Codable {
    
    let gender: String?
    let name: UserFullName?
    let location: Location?
    let picture: Picture?
    
    enum CodingKeys: String, CodingKey {
        case gender, name, location, picture
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(UserFullName.self, forKey: .name)
        picture = try values.decodeIfPresent(Picture.self, forKey: .picture)
    }
    
}

struct Picture: Codable {
    
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
    }
    
}

struct Location: Codable {
    
    let coordinates: UserCoordinate?
    
    enum CodingKeys: String, CodingKey {
        case coordinates
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coordinates = try values.decodeIfPresent(UserCoordinate.self, forKey: .coordinates)
    }
    
}

struct UserFullName: Codable {
    
    let first: String
    let last: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case first, last, title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first = try values.decodeIfPresent(String.self, forKey: .first) ?? ""
        last = try values.decodeIfPresent(String.self, forKey: .last) ?? ""
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
    }
    
}

struct UserCoordinate: Codable {
    
    let latitude: String?
    let longitude: String?
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
    }
    
}
