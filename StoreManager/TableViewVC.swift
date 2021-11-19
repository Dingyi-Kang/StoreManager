//
//  ViewController.swift
//  StoreManager
//
//  Created by DingyiKang on 11/18/21.
//

import UIKit

class TableViewVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    let items = Model().items
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let title = cell.viewWithTag(1) as? UILabel{
            title.text = items[indexPath.row].name
        }
        
        if let quantity = cell.viewWithTag(2) as? UILabel{
            quantity.text = "\(items[indexPath.row].quantity)"
        }
        
        if let price = cell.viewWithTag(3) as? UILabel{
            price.text = "$\(items[indexPath.row].price)"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            
            self.present(detailVC, animated: true, completion: nil)
        
        }
        
        
        
    }

}

