//
//  ViewController.swift
//  CheckBoxTerminosXIB
//
//  Created by Marco Alonso Rodriguez on 17/03/23.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    var acceptedTermsConditions: Bool = false
    var firstTimeToShow: Bool = false
    
    @IBOutlet weak var aceptarButton: UIButton!
    @IBOutlet weak var termsConditionsView: TerminosCondiciones!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(termsConditionsView.isCheck)
        setupUI()
        
    }
    
    private func setupUI(){
        /// - Desabilita el boton de continuar
        aceptarButton.isUserInteractionEnabled = false
        aceptarButton.isHidden = true
        
        /// - *Notifications para saber en que momento el usuario aceptó y poder habilitar el boton de continiar
        NotificationCenter.default.addObserver(self, selector: #selector(userAcceptedTerms), name: Notification.Name("Acepto"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(userDidNotAcceptedTerms), name: Notification.Name("NoAcepto"), object: nil)
        
        /// - Esta funcionalidad tambien se puede reemplazar con un escaping closure
        NotificationCenter.default.addObserver(self, selector: #selector(seeTextTerms), name: Notification.Name("VerTerminos"), object: nil)
        

    }
    
    @objc func seeTextTerms() {
       
        presentTextTermsAndConditions()
    }
    
    @objc func userAcceptedTerms() {
        //Si es la primera vez, muestra el Texto, si no, solo deshabilita el boton.
        if !firstTimeToShow {
            presentTextTermsAndConditions()
            firstTimeToShow = true
        }
        
        aceptarButton.isUserInteractionEnabled = true
        aceptarButton.isHidden = false
    }
    
    @objc func userDidNotAcceptedTerms() {
        aceptarButton.isUserInteractionEnabled = false
        aceptarButton.isHidden = true
    }
    
    func userAcceptedTermsAndCoditions(){
        termsConditionsView.isCheck = true
    }
    
    func presentTextTermsAndConditions(){
        let vc = TextoTerminosViewController(nibName: "TextoTerminosViewController", bundle: nil)
        self.present(vc, animated: true)
    }
    
    @IBAction func AceptarAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
    }
    

    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("Acepto"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NoAcepto"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("VerTerminos"), object: nil)
    }
}

