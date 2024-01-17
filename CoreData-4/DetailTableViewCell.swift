//
//  DetailTableViewCell.swift
//  CoreData-4
//
//  Created by NTS on 17/01/24.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var mobile : Mobile! {
        didSet{
            companyLabel.text = mobile.company
            modelLabel.text = mobile.model
            priceLabel.text = mobile.price
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
