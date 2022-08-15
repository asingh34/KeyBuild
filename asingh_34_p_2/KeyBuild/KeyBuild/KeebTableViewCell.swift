//
//  KeebTableViewCell.swift
//  KeyBuild
//
//  Created by Anant Singh on 7/13/21.
//

import UIKit

class KeebTableViewCell: UITableViewCell {

    @IBOutlet weak var keeb_name: UILabel!

    @IBOutlet weak var color_lbl: UILabel!
    @IBOutlet weak var info_string_lbl: UILabel!

    @IBOutlet weak var qty_lbl: UILabel!
    @IBOutlet weak var price_lbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func update(with keeb_item: Keeb) {
 
        if let color = keeb_item.value(forKey: "color") as? String,
            let name = keeb_item.value(forKey: "name") as? String,
            let price = keeb_item.value(forKey: "price") as? Int,
            let qty = keeb_item.value(forKey: "qty") as? Int,
            let info_string = keeb_item.value(forKey: "size_type") as? String {
            
            keeb_name?.text = name
            color_lbl?.text = color
            info_string_lbl?.text = info_string
            price_lbl?.text = price.description
            qty_lbl?.text = String(qty)
        
            }
        }
    }



