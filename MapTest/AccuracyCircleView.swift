//
//  AccuracyCircleView.swift
//  MapTest
//
//  Created by Dmitriy Borovikov on 23/04/2019.
//  Copyright © 2019 Dmitriy Borovikov. All rights reserved.
//

import UIKit

class AccuracyCircleView: UIView {
//    var label: UILabel!
    var radius: CGFloat = 100
    let color = UIColor.black.withAlphaComponent(0.75)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
//        label = UILabel(frame: CGRect(x: frame.size.width / 4,
//                                      y: frame.size.height - 20,
//                                      width: frame.size.width / 4,
//                                      height: 20))
//        label.text = "Acc: ???"
//        addSubview(label)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame)

//        let w = frame.size.width
//        let h = frame.size.height
//        let labelWrapper: UIView? = label.superview
//        labelWrapper?.frame = CGRect(x: w / 4, y: h - (labelWrapper?.frame.size.height ?? 0),
//                                     width: w / 4, height: labelWrapper?.frame.size.height ?? 0)
//        labelWrapper?.layer.mask?.frame = labelWrapper?.bounds ?? CGRect.zero
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        color.setStroke()
        context.addArc(center: CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2),
                        radius: radius,
                        startAngle: 0,
                        endAngle: 2 * .pi,
                        clockwise: true)
        context.strokePath()
    }
}
