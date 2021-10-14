//
//  DetailViewController.swift
//  Storyboards
//
//  Created by Gokul Sai Katragadda on 10/13/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    var number: Int?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(number ?? 0)"
        colorView.backgroundColor = color
    }
}
