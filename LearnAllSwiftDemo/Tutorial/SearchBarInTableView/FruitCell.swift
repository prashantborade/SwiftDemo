//
//  FruitCell.swift
//  LearnAllSwiftDemo
//
//  Created by Avion on 5/24/18.
//  Copyright © 2018 Avion. All rights reserved.
//

import UIKit

class FruitCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var imageFruit: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
