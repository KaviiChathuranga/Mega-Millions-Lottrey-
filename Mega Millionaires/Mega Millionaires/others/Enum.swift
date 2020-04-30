//
//  Enum.swift
//  Mega Millionaires
//
//  Created by Treinetic Macbook004 on 8/5/19.
//  Copyright © 2019 Treinetic Macbook004. All rights reserved.
//

import Foundation
import UIKit
class Enum {
    typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)
    
    enum GradientOrientation {
        case topRightBottomLeft
        case topLeftBottomRight
        case horizontal
        case vertical
        
        var startPoint : CGPoint {
            return points.startPoint
        }
        
        var endPoint : CGPoint {
            return points.endPoint
        }
        
        var points : GradientPoints {
            switch self {
            case .topRightBottomLeft:
                return (CGPoint(x: 0.0,y: 1.0), CGPoint(x: 1.0,y: 0.0))
            case .topLeftBottomRight:
                return (CGPoint(x: 0.5,y: 0.0), CGPoint(x: -0.2,y: 0.0))
            case .horizontal:
                return (CGPoint(x: 0.0,y: 0.5), CGPoint(x: 1.0,y: 0.5))
            case .vertical:
                return (CGPoint(x: 0.0,y: 0.0), CGPoint(x: 0.0,y: 1.0))
            }
        }
    }
}
