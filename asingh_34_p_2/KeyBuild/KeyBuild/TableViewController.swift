//
//  TableViewController.swift
//  KeyBuild
//
//  Created by Anant Singh on 7/13/21.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var keyboards: [NSManagedObject] = []
    var class_keebs = Keebs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        readData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return SizeType.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return keyboards.count
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return SizeType(rawValue: section)?.size()
//    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KeebTableViewCell", for: indexPath) as? KeebTableViewCell else {
            fatalError("Expected UITableViewCell")
        }
//        let keeb = keyboards[indexPath.row]
//        cell.color?.text = keeb.value(forKey: "color") as? String
//        cell.keeb_name?.text = keeb.value(forKey: "name") as? String
//        cell.info_string?.text = keeb.value(forKey: "size_type") as? String
//
//        //ugly way to convert the the ints to strings from core data
//        let int_price = keeb.value(forKey: "price") as! Int
//        let str_price = "\(String(describing: int_price))"
//        cell.price?.text = str_price
//
//
//        let int_qty = keeb.value(forKey: "qty") as! Int
//        let str_qty = "\(String(describing: int_qty))"
//        cell.qty?.text = str_qty
//
        if let keeb = keyboards[indexPath.row] as? Keeb {
            cell.update(with: keeb)
        }
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete{
//            if let keeb = keyboards[indexPath.row] as? Keeb {
//                self.delete(keeb)
//            }
//        }
//    }
    
//MARK: - CoreData
    
    func readData() {
        let context = AppDelegate.cdContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Keeb")
        do {
            keyboards = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
        tableView.reloadData()
    }
//    func saveItem(color: String, name: String, price: Int, qty: Int, size_type: String){
//        let context = AppDelegate.cdContext
//        if let entity = NSEntityDescription.entity(forEntityName: "Keeb", in: context){
//            let keyboard_item = NSManagedObject(entity: entity, insertInto: context)
//            keyboard_item.setValue(color, forKeyPath: "color")
//            keyboard_item.setValue(name, forKeyPath: "name")
//            keyboard_item.setValue(price, forKeyPath: "price")
//            keyboard_item.setValue(qty, forKeyPath: "qty")
//            keyboard_item.setValue(size_type, forKeyPath: "size_type")
//
//            do {
//                try context.save()
//            } catch let error as NSError {
//                print("Could not save the item. \(error), \(error.userInfo)")
//            }
//        }
//    }
    func deleteItem(keeb: Keeb) {
        let context = AppDelegate.cdContext
        if let _ = keyboards.firstIndex(of: keeb)  {
            context.delete(keeb)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the item. \(error), \(error.userInfo)")
            }
        }
        readData()
    }

    

//MARK: - Actions
    
    @IBAction func onCart(_ sender: UIBarButtonItem) {
        
    }
    

    @IBAction func onAdd(_ sender: UIBarButtonItem) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
