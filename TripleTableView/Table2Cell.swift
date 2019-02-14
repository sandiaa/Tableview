//
//  Table2Cell.swift
//  TripleTableView
//
//  Created by Admin on 19/12/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class Table2Cell: UITableViewCell {

    @IBOutlet var pincode: UILabel!
    @IBOutlet var religion: UILabel!
    @IBOutlet var color: UILabel!
    @IBOutlet var favColor: UILabel!
    @IBOutlet var country: UILabel!
    @IBOutlet var state: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var school: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
