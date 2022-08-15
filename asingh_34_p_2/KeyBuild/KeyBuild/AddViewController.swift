//
//  AddViewController.swift
//  KeyBuild
//
//  Created by Anant Singh on 7/13/21.
//

import UIKit
import CoreData

let color_selct = ["Black","Red","White"]


class AddViewController: UIViewController {
    
   
    //keyboard name
    @IBOutlet weak var enter_name: UITextField!
    //keyboard sizes
    @IBOutlet weak var sixtyfive_btn: UIButton!
    @IBOutlet weak var seventy_btn: UIButton!
    @IBOutlet weak var seventyfive_btn: UIButton!
    @IBOutlet weak var nintey_btn: UIButton!
    @IBOutlet weak var full_btn: UIButton!
    //switch picker
    @IBOutlet weak var switch_picker: UIPickerView!
    //quantity stepper
    @IBOutlet weak var qty_stepper: UIStepper!
    @IBOutlet weak var qty_label: UILabel!
    
    @IBOutlet weak var save_btn: UIBarButtonItem!
    
    
    var quantity = 0 {
        willSet {
            qty_label?.text = newValue.description
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        sixtyfive_btn.titleLabel?.text = "65%"
        seventy_btn.titleLabel?.text = "70%"
        seventyfive_btn.titleLabel?.text = "75%"
        nintey_btn.titleLabel?.text = "90%"
        full_btn.titleLabel?.text = "100%"
        qty_stepper?.value=0
    
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func on_qty(_ sender: UIStepper) {
        quantity = Int(sender.value)
    }
    
    
    
    @IBAction func enter_name(_ sender: UITextField){
       
    }
    var size_type : String = ""
    var price_int : Int = 0
    //butons
    @IBAction func on_sixtyFive(_ sender: UIButton) {
        size_type="65%"
        price_int = 100
    }
    
    @IBAction func on_seventy(_ sender: UIButton) {
        size_type="70%"
        price_int = 150
    }
    
    @IBAction func on_seventyFive(_ sender: UIButton) {
        size_type = "75%"
        price_int = 200
    }
    
    @IBAction func on_nintey(_ sender: UIButton) {
        size_type = "90%"
        price_int = 400
        
    }
    
    @IBAction func on_full(_ sender: UIButton) {
        size_type = "100%"
        price_int = 500
    }
    
    
    
    
    @IBAction func on_save(_ sender: UIBarButtonItem) {
            
        if let name = enter_name?.text{
            let context = AppDelegate.cdContext
            if let entity = NSEntityDescription.entity(forEntityName: "Keeb", in: context) {
                let keeb_item = NSManagedObject(entity: entity, insertInto: context)
                keeb_item.setValue(name, forKeyPath: "name")
                keeb_item.setValue(size_type, forKey: "size_type")
                keeb_item.setValue(price_int, forKey: "price")
                keeb_item.setValue(switch_picker.selectedRow(inComponent: 0), forKey: "color")
                keeb_item.setValue(Int(qty_stepper.value), forKey: "qty")

                do {
                    try context.save()
                } catch let error as NSError {
                    print("Could not save the item. \(error), \(error.userInfo)")
                }
            }
        }
        presentingViewController?.dismiss(animated: true)
    }
}

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
extension AddViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return color_selct.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return color_selct[row]
    }
    
    
   
}

