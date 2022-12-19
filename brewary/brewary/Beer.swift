//
//  Beer.swift
//  brewary
//
//  Created by seobyeonggwan on 2022/12/19.
//

import Foundation

struct Beer: Decodable {
    let id: Int?
    let name, taglineString, description, brewersTips, imageURL: String?
    let foodParing: [String]?
    
    var tagLine: String {
        let tags = taglineString?.components(separatedBy: ". ")
        let hashTags = tags?.map {
            "#" + $0.replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ".", with: "")
                .replacingOccurrences(of: ",", with: "")
        }
        return hashTags?.joined(separator: " ") ?? ""
    }
    
    enum codingKeys: String, CodingKey {
        case id, name, description
        case taglineString = "tagline"
        case imageURL = "image_url"
        case brewersTips = "brewers_tips"
        case foodParing = "food_paring"
    }
}
