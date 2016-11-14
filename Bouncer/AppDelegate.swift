//
//  AppDelegate.swift
//  Bouncer
//
//  Created by Sriharsha Sammeta on 19/04/15.
//  Copyright (c) 2015 Sriharsha Sammeta. All rights reserved.
//

import UIKit
import CoreMotion

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    struct Motion{
        static let manager = CMMotionManager()
    }

}

