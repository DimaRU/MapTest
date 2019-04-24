//
//  CrossHairView.swift
//  MapTest
//
//  Created by Dmitriy Borovikov on 23/04/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import UIKit

class CrossHairView: UIView {
//    var latLabel: UILabel!
//    var lngLabel: UILabel!
    let color = UIColor.white.withAlphaComponent(0.75)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
//        autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        initLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
//        autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        isUserInteractionEnabled = false
        initLabels()
    }
    
    private func initLabels() {
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame)
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setAllowsAntialiasing(false)
        context.setLineWidth(1)
        color.setStroke()
        context.move(to: CGPoint(x: bounds.origin.x, y: bounds.size.height / 2))
        context.addLine(to: CGPoint(x: bounds.size.width, y: bounds.size.height / 2))
        context.move(to: CGPoint(x: bounds.size.width / 2, y: bounds.origin.y))
        context.addLine(to: CGPoint(x: bounds.size.width / 2, y: bounds.size.height))
        context.strokePath()
    }
}
