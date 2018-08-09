//
//  SchoolTableViewCell.swift
//  20180808-LuisEscamilla-NYCSchools
//
//  Created by Luis Escamilla on 08/08/18.
//  Copyright © 2018 Luis Escamilla. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var websiteBtn: UIButton!
    var schoolViewModel: SchoolViewModel? = nil {
        didSet {
            descriptionLbl.text = schoolViewModel?.description
            websiteBtn.setTitle(schoolViewModel?.website, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openURL(_ sender: Any) {
        if let url = schoolViewModel?.websiteURL, UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
}
