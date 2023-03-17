//
//  TextoTerminosViewController.swift
//  CheckBoxTerminosXIB
//
//  Created by Marco Alonso Rodriguez on 17/03/23.
//

import UIKit

class TextoTerminosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func aceptarTerminosAction(_ sender: UIButton) {
        if let vc = presentingViewController as? StartScreenViewController {
            //before dismissing the Form ViewController, pass the data inside the closure
            dismiss(animated: true, completion: {
                vc.acceptedTermsConditions = true
                vc.userAcceptedTermsAndCoditions()
            })
        }
    }
    
    

}
