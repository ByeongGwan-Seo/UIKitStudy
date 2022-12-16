//
//  Content.swift
//  NetflixStyleSample
//
//  Created by seobyeonggwan on 2022/12/16.
//

import Foundation

struct Content: Decodable {
    let sectionType: String
    let sectionName: String
    let contetnItem: [Item]
}

struct Item: Decodable {
    let description: String
    let imageName: String
}
