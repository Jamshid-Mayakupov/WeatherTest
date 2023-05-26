//
//  ViewController.swift
//  WeatherTest
//
//  Created by User on 26/05/23.
//

import UIKit

class MainController: ViewController{
    
    var weatherManager : WeatherManager?

    let _view = MainView()

    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager = WeatherManager(delegate: self)
        DispatchQueue.global().async {
            self.weatherManager?.refreshWeather()
        }
    }
    
    
    override func setupTargets() {
        super.setupTargets()
        _view.collectionView.delegate = self
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(systemItem: .action , menu: _view.menu)]
    }
    
}

extension MainController: ReloadProtocol{
    func reloadData() {
        print("RELOADED DATA")
        _view.weather = weatherManager?.weather
    }
}

extension MainController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3.5, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? WeatherCell, let model = cell.model else {
            fatalError("invalid cell type")
        }
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let vc = DetailController()
        vc._view.weatherDay = model
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

