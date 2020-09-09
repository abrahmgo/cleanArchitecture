//
//  UIViewController.swift
//  Utils
//
//  Created by Andrés Bonilla Gómez on 09/09/20.
//  Copyright © 2020 Andrés Bonilla Gómez. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    static var typeName: String {
        return String(describing: self)
    }
}
