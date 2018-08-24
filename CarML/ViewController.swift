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
    
    let cars = Cars()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //para diseño de interfaz grafica
        self.stackView.setCustomSpacing(20, after: self.modelSegmentedControl)
        self.stackView.setCustomSpacing(20, after: self.extrasSwitch)
        self.stackView.setCustomSpacing(20, after: self.kmsSlider)
        self.stackView.setCustomSpacing(50, after: self.statusSegmentedControl)
        
        self.calculateValue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func calculateValue() {
        //formateo el valor del slider
        let formatter = NumberFormatter ()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        
        let formatterKms = formatter.string(for: self.kmsSlider.value) ?? "0"
        
        self.kmsLabel.text = "Kilometraje: \(formatterKms) kms"
        
        
        // calcular valor coche con CoreML
        if let prediction = try? cars.prediction(modelo: Double(self.modelSegmentedControl.selectedSegmentIndex),
                                                 extras: Double(self.extrasSwitch.isOn ? Double(1.0) : Double(0.0)), //ternario si ? sino :
                                                 kilometraje: Double(self.kmsSlider.value),
                                                 estado: Double(self.statusSegmentedControl.selectedSegmentIndex)){
            
            //para que lo minimo sea 500.. valor de corte
            let clampValue = max(500, prediction.precio)
            
            formatter.locale = NSLocale(localeIdentifier: "en_US") as Locale?
            formatter.numberStyle = .currency
            self.priceLabel.text = formatter.string(for: clampValue)
        }
        else {
            self.priceLabel.text = "Error!!!!"
        }
        
    }
    
    

}

