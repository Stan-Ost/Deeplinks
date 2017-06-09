//
//  ViewController.swift
//  Deeplinks
//
//  Created by Stanislav Ostrovskiy on 5/25/17.
//  Copyright © 2017 Stanislav Ostrovskiy. All rights reserved.
//

import UIKit

enum ProfileType: String {
    case guest = "Guest"
    case host = "Host"
}

class ViewController: UIViewController {

    var currentProfile = ProfileType.guest
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFor(profileType: currentProfile)
    }
    
    @IBAction func didPressSwitchProfile(_ sender: Any) {
        currentProfile = currentProfile == .guest ? .host : .guest
        configureFor(profileType: currentProfile)
    }
    
    func configureFor(profileType: ProfileType) {
        title = profileType.rawValue
        ShortcutParser.shared.registerShortcuts(for: profileType)
    }
}
