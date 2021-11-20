//
//  ViewController.swift
//  StoreManager
//
//  Team Project for Software Engineering course -- CS5473
//  Created by DingyiKang on 11/19/21.
//

import UIKit
import CoreData

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [Item]()
    
    var selectedIndex:IndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self;
        tableView.dataSource = self;
        fectchItems()
    }

    func fectchItems(){
        do{
            self.items = try context.fetch(Item.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch{
            
        }
        
    }
    
    
    
    @IBAction func addTapped(_ sender: Any) {
        
        //clear select
        if selectedIndex != nil {
                tableView.deselectRow(at: selectedIndex!, animated: true)
            selectedIndex = nil
            
        }
        
        if let addVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ADD") as? AddViewController{
            addVC.delegate = self
            self.present(addVC, animated: true, completion: nil)
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 {
            return 1
        } else {
            return items.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            if let title = cell.viewWithTag(1) as? UILabel{
                title.text = items[indexPath.row].name
            }
            
            if let quantity = cell.viewWithTag(2) as? UILabel{
                quantity.text = "\(items[indexPath.row].quantity)"
            }
            
            if let price = cell.viewWithTag(3) as? UILabel{
                price.text =   String(format: "$%.2f",items[indexPath.row].price)
            }
 
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            if let addButton = cell.viewWithTag(1) as? UIButton{
                addButton.layer.cornerRadius = 10
                addButton.layer.masksToBounds = true//important
            }
        }
        

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if some one is selected
        
        if indexPath.section == 1{
            
            if selectedIndex != nil{
                tableView.deselectRow(at: selectedIndex!, animated: true)
                selectedIndex = nil
            }
            return
        }
        
        if let selected = selectedIndex {
            if selected == indexPath{
                tableView.deselectRow(at: selectedIndex!, animated: true)
                selectedIndex = nil
            } else {
                tableView.deselectRow(at: selectedIndex!, animated: true)
                selectedIndex = indexPath
            }
        }
        //if it is nil
        else {
            selectedIndex = indexPath
        }
        
        guard selectedIndex != nil else {return}
        
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            
            detailVC.item = items[indexPath.row]
            detailVC.rootVC = self
            self.present(detailVC, animated: true, completion: nil)
        }
        
        }

}

extension TableViewVC: tableViewDelegate{
    func refresh() {
        self.fectchItems()
    }
}
