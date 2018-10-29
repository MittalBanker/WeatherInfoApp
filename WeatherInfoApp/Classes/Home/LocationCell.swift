//
//  LocationCell.swift
//  WeatherInfoApp
//
//  Created by Mittal Banker on 28/10/18.
//  Copyright © 2018 Mittal Banker. All rights reserved.
//

import Foundation
import UIKit
class LocationCell: UITableViewCell {

    @IBOutlet var locationLbl: UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
