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
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Collection View"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue", let destination = segue.destination as? DetailViewController {
            destination.number = selectedNumberColorTuple?.0
            destination.color = selectedNumberColorTuple?.1
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
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

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedNumber = numbersArray[indexPath.item]
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        let selectedColor = cell.contentView.backgroundColor ?? .red
        selectedNumberColorTuple = (selectedNumber, selectedColor)
        performSegue(withIdentifier: "DetailViewSegue", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.bounds.width
        if traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .regular {
            let columns = 4
            size -= CGFloat((columns - 1) * 10)
            let width = size/CGFloat(columns)
            return CGSize(width: width, height: width)
        } else {
            let columns = 7
            size -= CGFloat((columns - 1) * 10)
            let width = size/CGFloat(columns)
            return CGSize(width: width, height: width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
