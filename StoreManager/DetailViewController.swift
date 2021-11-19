//
//  DetailViewController.swift
//  StoreManager
//
//  Created by DingyiKang on 11/19/21.
//

import UIKit

class DetailViewController: UIViewController {

    var item:Item?
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.layer.cornerRadius = 2.0
        deleteButton.layer.cornerRadius = 2.0
        
        if let item = item {
            nameLabel.text = item.name
            quantityLabel.text = "\(item.quantity)"
            priceLabel.text = "$\(item.price)"
        }
       
    }
    
    
    @IBAction func editTapped(_ sender: Any) {
    }
    
    
    @IBAction func deleteTapped(_ sender: Any) {
    }
    
}
