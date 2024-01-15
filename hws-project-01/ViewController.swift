//
//  ViewController.swift
//  hws-project-01
//
//  Created by Edwin Cardenas on 1/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var weatherPictures = [String]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                weatherPictures.append(item)
            }
        }
        
        print(weatherPictures)
    }
}

