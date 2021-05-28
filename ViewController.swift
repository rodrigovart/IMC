//
//  ViewController.swift
//  IMC
//
//  Created by MAC on 27/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var viewResult: UIView!
    @IBOutlet weak var imgResult: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(txtWeight.text!), let height = Double(txtHeight.text!){
            let resultIMC = weight / pow(height, 2)
            
            showIMC(imc: resultIMC)
        }else{
            let alert = UIAlertController(title: "", message: "DIGITE OOS CAMPOS CORRETAMENTE", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showIMC(imc: Double) -> Void {
        var result: String
        var image: String
        
        switch imc {
        case 0..<16:
            result = "MAGREZA"
            image = "magreza"
        case 16..<18.5:
            result = "ABAIXO DO PESO"
            image = "abaixo"
        case 18.5..<25:
            result = "PESO IDEAL"
            image = "ideal"
        case 25..<30:
            result = "SOBREPESO"
            image = "sobre"
        default:
            result = "OBESIDADE"
            image = "obesidade"
        }
        
        lblResult.text = "\(Int(imc)): \(result)"
        imgResult.image = UIImage(named: image)
        viewResult.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

