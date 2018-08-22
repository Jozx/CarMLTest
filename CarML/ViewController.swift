//
//  ViewController.swift
//  CarML
//
//  Created by Jose Saracho on 8/20/18.
//  Copyright © 2018 JosApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var modelSegmentedControl: UISegmentedControl!
    @IBOutlet weak var extrasSwitch: UISwitch!
    @IBOutlet weak var kmsLabel: UILabel!
    @IBOutlet weak var kmsSlider: UISlider!
    @IBOutlet weak var statusSegmentedControl: UISegmentedControl!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func calculateValue() {
        
    }
    
    

}

