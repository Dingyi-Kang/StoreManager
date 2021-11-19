//
//  AddViewController.swift
//  StoreManager
//
//  Created by DingyiKang on 11/19/21.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.layer.cornerRadius = 10.0
        
        confirmButton.layer.cornerRadius = 10
        confirmButton.layer.masksToBounds = true
        
        cancelButton.layer.cornerRadius = 10
        cancelButton.layer.masksToBounds = true
        
    
    }
    

    @IBAction func exitTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func confirmTapped(_ sender: Any) {

        //check
        
        if let name = nameTextField.text, let quantity = quantityTextField.text, let price = priceTextField.text{
            
            if let quan = Int(quantity), let pric = Double(price){
                print("Submit: "+name+" "+String(quan)+" "+String(pric))
                
                //submit to database
                
                //add this as completion closure
                self.dismiss(animated: true, completion: nil)
                return
            }
        }
                
        //report error
        
        let alert = UIAlertController(title: "Error", message: "Your input is invalid. Please try again.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
}
