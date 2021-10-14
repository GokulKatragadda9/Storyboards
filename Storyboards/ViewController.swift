//
//  ViewController.swift
//  Storyboards
//
//  Created by Gokul Sai Katragadda on 10/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let colors: [UIColor] = [.blue, .brown, .cyan, .green, .orange, .gray, .red, .yellow, .magenta]
    let numbersArray = Array(0...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NumberTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: type(of: NumberTableViewCell.self)))
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: type(of: NumberTableViewCell.self))) as? NumberTableViewCell
        cell?.label.text = "\(numbersArray[indexPath.row])"
        cell?.colorView.backgroundColor = colors.randomElement()
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersArray.count
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
