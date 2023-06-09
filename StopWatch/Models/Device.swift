//
//  Device.swift
//  StopWatch
//
//  Created by ChaoBo-Shang on 2023/6/9.
//

import UIKit

enum Device {
    //MARK: iphone ipad mac
    enum Devicetype{
        case iphone, ipad, mac
    }
    
    static var deviceType: Devicetype{
        #if os(macOS)
        return .mac
        #else
        if  UIDevice.current.userInterfaceIdiom == .pad {
            return .ipad
        }
        else {
            return .iphone
        }
        #endif
    }
 }
