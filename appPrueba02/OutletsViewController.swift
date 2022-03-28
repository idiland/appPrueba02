//
//  OutletsViewController.swift
//  appPrueba02
//
//  Created by user190736 on 3/28/22.
//

import UIKit

class OutletsViewController: UIViewController {

    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var buttonTop: UIButton!
    @IBOutlet weak var selectorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTop.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        buttonTop.setTitle("Soy un Botón", for: .normal)
        
        selectorButton.addTarget(self, action: #selector(selectorButtonPressed),
            for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func selectorButtonPressed() {
        print("selectorButtonPressed ha sido pulsado")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Botón ha sido pulsado")
        showAlert()
    }
    
    
    //Show alert
    func showAlert(){
        
        let alert = UIAlertController(title: "Seleccionar Acción", message: "Seleccione Una", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction (title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            self.getImage(fromSourceType: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action:
        UIAlertAction) in
            self.getImage(fromSourceType: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title:"Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Método Get Image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
        
        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self as? UIImagePickerControllerDelegate &
                UINavigationControllerDelegate
            imagePickerController.sourceType = sourceType
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
