//
//  ExtensionUIDevice.swift
//  CloudCourse
//
//  Created by FSAnonymous on 21/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
extension UIDevice {
    public func isPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}
