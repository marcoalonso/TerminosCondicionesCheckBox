//
//  TerminosCondiciones.swift
//  CheckBoxTerminosXIB
//
//  Created by Marco Alonso Rodriguez on 17/03/23.
//

import UIKit

class TerminosCondiciones: UIView {
    
    @IBOutlet weak var checkButton: UIButton!
    var isCheck: Bool = false {
        didSet {
            if isCheck {
                ///Publica la notificacion para el StartScreen sepa que ya debe habilitar el boton de continiar
                NotificationCenter.default.post(name: Notification.Name("Acepto"), object: self)
                
                ///Pinta el checkBox Button
                checkButton.setImage(UIImage(systemName: "checkmark.rectangle"), for: .normal)
                
            } else {
                NotificationCenter.default.post(name: Notification.Name("NoAcepto"), object: self)
                ///Despinta el checkBox Button
                checkButton.setImage(UIImage(systemName: "square"), for: .normal)
            }
        }
    }
    
    //Var escaping que cuando algo este listo la active, y devolverá un true
    

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
       
    }
    
    func setup() {
        ///Preparar el nib para ser des-archivado e instanciado,
        let nib = UINib(nibName: "TerminosCondiciones", bundle: nil)
        guard let termsConditionsView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Error al instanciar xib")
        }
        addSubview(termsConditionsView)
        checkButton.setImage(UIImage(systemName: "square"), for: .normal)
    }
    
    
    
   
    
    @IBAction func termsAndConditionsButtonAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("VerTerminos"), object: self)
    }
    
    
    @IBAction func checkUncheckButtonAction(_ sender: UIButton) {
        ///Notificar al StartVc que muestre el TextoTerminos
        
        //Implementar un escapingClosure
        isCheck = !isCheck
    }
    
    public func getBackActionToOpenText(completion: @escaping (_ mostrar: Bool) -> () ) {
        if isCheck {
            completion(true)
        } else {
            completion(false)
        }
    }
    
}
