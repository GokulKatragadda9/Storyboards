//
//  CollectionViewController.swift
//  Storyboards
//
//  Created by Gokul Sai Katragadda on 10/13/21.
//

import Foundation
import UIKit


class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colors: [UIColor] = [.blue, .brown, .cyan, .green, .orange, .gray, .red, .yellow, .magenta]
    let numbersArray = Array(0...100)
    
    var selectedNumberColorTuple: (Int, UIColor)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Collection View"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue", let destination = segue.destination as? DetailViewController {
            destination.number = selectedNumberColorTuple?.0
            destination.color = selectedNumberColorTuple?.1
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numbersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NumberCollectionViewCell", for: indexPath) as! NumberCollectionViewCell
        cell.label.text = "\(numbersArray[indexPath.item])"
        cell.colorView.backgroundColor = colors.randomElement()
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedNumber = numbersArray[indexPath.item]
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        let selectedColor = cell.contentView.backgroundColor ?? .red
        selectedNumberColorTuple = (selectedNumber, selectedColor)
        performSegue(withIdentifier: "DetailViewSegue", sender: self)
    }
}
