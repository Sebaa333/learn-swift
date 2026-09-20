//
//  ColorsDetailVC.swift
//  RandomColors
//
//  Created by sebastian santivanez on 24/05/2026.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    var color: UIColor?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue

        
    }
    

}
