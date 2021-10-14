//
//  ViewController.swift
//  Storyboards
//
//  Created by Gokul Sai Katragadda on 10/13/21.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let colors: [UIColor] = [.blue, .brown, .cyan, .green, .orange, .gray, .red, .yellow, .magenta]
    let numbersArray = Array(0...100)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NumberTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: type(of: NumberTableViewCell.self)))
        navigationController?.title = "TableView"
    }
}

extension TableViewController: UITableViewDataSource {
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

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            return 220
        }
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        let cell = tableView.cellForRow(at: indexPath) as? NumberTableViewCell
        vc.number = numbersArray[indexPath.row]
        vc.color = cell?.colorView.backgroundColor ?? UIColor.red
        navigationController?.pushViewController(vc, animated: true)
    }
}
