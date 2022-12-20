//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by seobyeonggwan on 2022/12/19.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0)
}
