//
//  UUSRSolutionSwift.swift
//  UUSRSolutionSwift
//
//  Created by youyou on 2020/7/31.
//  Copyright © 2020 iceyouyou. All rights reserved.
//

import Foundation
import UIKit

extension BinaryFloatingPoint {
    var s: CGFloat {
        get {
            CGFloat(self) * UUSRSolutionSwift.S
        }
    }
    
    var rs: CGFloat {
        get {
            CGFloat(self) * UUSRSolutionSwift.RS
        }
    }
}

enum UUSRSolutionDevice {
    case iPhone6
    case iPhone6P
    case iPhoneX
    case iPhoneXR
    case iPhoneXSMax
}

struct UUSRSolutionSwift {
    static var S: CGFloat {
        get {
            return Scale ?? { () -> CGFloat in
                    // set default design device to 'iPhone6'
                    setDesignDevice(.iPhone6)
                    return Scale!
                }()
        }
    }
    
    static var RS: CGFloat {
        get {
            return RealScale ?? { () -> CGFloat in
                    // set default design device to 'iPhone6'
                    setDesignDevice(.iPhone6)
                    return RealScale!
                }()
        }
    }
    
    static func setDesignDevice(_ designDevice: UUSRSolutionDevice) {
        RealScale = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * DeviceScreenInfo[designDevice]![2] / DeviceScreenInfo[designDevice]![0]
        if UIDevice.current.userInterfaceIdiom == .pad {
            Scale = 1.0
        } else {
            Scale = RealScale
        }
    }
}

extension UUSRSolutionSwift {
    static private var Scale: CGFloat?
    static private var RealScale: CGFloat?
    static private let DeviceScreenInfo: [UUSRSolutionDevice: [CGFloat]] = [
        /* device:    [width,  height, scale] */
        .iPhone6:     [750.0,  1334.0, 2.0],
        .iPhone6P:    [1242.0, 2208.0, 3.0],
        .iPhoneX:     [1125.0, 2436.0, 3.0],
        .iPhoneXR:    [828.0,  1792.0, 2.0],
        .iPhoneXSMax: [1242.0, 2688.0, 3.0]
    ]
}
