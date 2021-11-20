//
//  DetailViewController.swift
//  StoreManager
//
//  Team Project for Software Engineering course -- CS5473
//  Created by DingyiKang on 11/19/21.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var item:Item?
    
    var rootVC:TableViewVC?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let item = item {
            nameLabel.text = item.name
            quantityLabel.text = "\(item.quantity)"
            priceLabel.text = "$\(item.price)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let item = item {
            nameLabel.text = item.name
            quantityLabel.text = "\(item.quantity)"
            priceLabel.text = "$\(item.price)"
        }
    }

    
    
    @IBAction func editTapped(_ sender: Any) {
        
        if let addVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ADD") as? AddViewController{
            
            addVC.item = self.item
            
            addVC.delegate = self.rootVC
            addVC.delegate2 = self
            
            self.present(addVC, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func deleteTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to delete this item record?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { action in
            print("delete")
            //TODO: delete this to database
            
            self.context.delete(self.item!)
            try! self.context.save()
            self.rootVC?.refresh()
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(yes)
        
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
        
        alert.addAction(no)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}

extension DetailViewController: detailViewDelegate{
    func refresh(item: Item) {
        self.item = item
//        self.view.layoutIfNeeded()
//        self.view.setNeedsLayout()
        self.dismiss(animated: true, completion: nil)
    }
}

protocol tableViewDelegate{
    
    func refresh()
}
