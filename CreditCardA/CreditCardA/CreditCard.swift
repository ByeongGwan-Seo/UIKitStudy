//
//  CreditCard.swift
//  CreditCardA
//
//  Created by seobyeonggwan on 2022/12/13.
//

import Foundation

struct CreditCard: Codable {
    let id: Int
    let rank: Int
    let name: String
    let cardImageURL: String
    let promotionDetail: PromotionDetail
    let isSelected: Bool?
    
}

struct PromotionDetail: Codable {
    let companyName: String
    let period: String
    let amount: Int
    let benefitDate: String
    let benefitDetail: String
    let benefitCondition: String
    let condition: String
}
