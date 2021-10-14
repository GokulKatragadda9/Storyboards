//
//  NumberTableViewCell.swift
//  Storyboards
//
//  Created by Gokul Sai Katragadda on 10/13/21.
//

import Foundation
import UIKit


class NumberTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.cornerRadius = 10
    }
}
