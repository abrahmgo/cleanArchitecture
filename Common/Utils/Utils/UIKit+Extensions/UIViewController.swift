//
//  UIViewController.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit
import SafariServices

public extension UIViewController {
    
    static var typeName: String {
        return String(describing: self)
    }
    
    func showWebPage(urlWebPage: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        config.barCollapsingEnabled = true
        let vc = SFSafariViewController(url: urlWebPage, configuration: config)
        self.present(vc, animated: true, completion: nil)
    }
}
