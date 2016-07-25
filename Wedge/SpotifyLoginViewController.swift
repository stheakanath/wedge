//
//  SpotifyLoginViewController.swift
//  Wedge
//
//  Created by Kuriakose Theakanath on 7/25/16.
//  Copyright © 2016 Kuriakose Sony Theakanath. All rights reserved.
//

import UIKit

class SpotifyLoginViewController: UIViewController, SPTAuthViewDelegate, SPTAudioStreamingPlaybackDelegate {
    override func viewDidAppear(animated: Bool) {
        let auth = SPTAuth.defaultInstance()
        auth.clientID        = "1aa1be3239874d99aa3ece3398821fb9"
        auth.redirectURL     = NSURL.init(string:"spotifyiossdkexample://")
        auth.requestedScopes = [SPTAuthStreamingScope]
        
        let authvc = SPTAuthViewController.authenticationViewController()
        authvc.modalPresentationStyle   = UIModalPresentationStyle.OverCurrentContext
        authvc.modalTransitionStyle     = UIModalTransitionStyle.CrossDissolve
        authvc.delegate                 = self // Comment this line if you want to build right now
        
        self.modalPresentationStyle     = UIModalPresentationStyle.CurrentContext
        self.definesPresentationContext = true
        self.presentViewController(authvc, animated: true, completion: nil)
    }
 
    func authenticationViewController(authenticationViewController: SPTAuthViewController!, didLoginWithSession session: SPTSession!) {
        print("Login")
    }
    
    func authenticationViewController(authenticationViewController: SPTAuthViewController!, didFailToLogin error: NSError!) {
        print("Fail to login")
    }
    
    func authenticationViewControllerDidCancelLogin(authenticationViewController: SPTAuthViewController!) {
        print("Cancel login")
    }

}
