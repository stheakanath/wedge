//
//  AppDelegate.swift
//  Wedge
//
//  Created by Kuriakose Sony Theakanath on 7/3/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    @available(iOS 9.0, *)
    func application(application: UIApplication,openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String, annotation: options [UIApplicationOpenURLOptionsAnnotationKey])
    }

}

