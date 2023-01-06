//
//  DiagonalCustomImageView.swift
//  CodeConnectsXib
//
//  Created by seobyeonggwan on 2023/01/05.
//

import UIKit

@IBDesignable
class DiagonalCustomImageView: UIImageView {

    // 대각선으로 잘린 사각형을 그린다.
    // bezierPath(패스를 딴다)
    // path -> layer
    // layer를 마스킹
    // 직접 만든 커스텀 코드를 스토리보드 편집화면에서 바로 확인할 수 있도록 하기
    
    @IBInspectable var innerHeight: CGFloat = 0
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    override func layoutSubviews() {
        makeMask()
    }
}
