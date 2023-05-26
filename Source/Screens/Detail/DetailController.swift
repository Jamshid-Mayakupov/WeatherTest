//
//  DetailController.swift
//  WeatherTest
//
//  Created by User on 26/05/23.
//

import UIKit

class DetailController: ViewController{
    
    let _view = DetailView()
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupTargets() {
        super.setupTargets()
        _view.collectionView.delegate = self
    }
}


extension DetailController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height - 10)
    }
}

