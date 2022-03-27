//
//  ViewController.swift
//  appPrueba02
//
//  Created by user190736 on 3/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    var contador = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func perfomVlick(_ sender: UIButton) {
        contador += 1
        print(contador)
        myLabel.text = "Hola Mundo!!! \(contador)"
    }
    
}

