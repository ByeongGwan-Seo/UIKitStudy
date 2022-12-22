//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by seobyeonggwan on 2022/12/22.
//

import Foundation
import Combine

final class MyPointViewModel {
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }

}
