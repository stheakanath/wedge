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
class AppDelegate: UIResponder, UIApplicationDelegate, SPTAudioStreamingDelegate {

    var window: UIWindow?
    
    var session: SPTSession?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        SPTAuth.defaultInstance().clientID = "1aa1be3239874d99aa3ece3398821fb9"
        SPTAuth.defaultInstance().redirectURL = NSURL(string: "wedge-fomo")
        SPTAuth.defaultInstance().requestedScopes = [SPTAuthStreamingScope]
        
        return true
    }
    
    @available(iOS 9.0, *)
    func application(application: UIApplication,openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String, annotation: options [UIApplicationOpenURLOptionsAnnotationKey])

        
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool{
        
        if (SPTAuth.defaultInstance().canHandleURL(url)) {
            
            
            
            SPTAuth.defaultInstance().handleAuthCallbackWithTriggeredAuthURL(url, callback: { (error : NSError?, session : SPTSession?) -> Void in
                
                
                if error != nil {
                    
                    print("Auth error : \(url.description)")
                    return
                }
                
                let userDefaults = NSUserDefaults.standardUserDefaults()
                let sessionData = NSKeyedArchiver.archivedDataWithRootObject(session!)
                userDefaults.setObject(sessionData, forKey: "spotifySession")
                
                userDefaults.synchronize()
                
                NSNotificationCenter.defaultCenter().postNotificationName("spotifyLoginSuccesfull", object: nil)
                
            })
            
            return true
        }
        
        if (FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)) {
            
            return true
        }
        
        return false
    }

}

