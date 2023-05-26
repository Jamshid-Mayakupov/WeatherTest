//
//  MainView.swift
//  TestWeather
//
//  Created by User on 25/05/23.
//

import Foundation
import UIKit

class MainView: View {
    
    var menu: UIMenu?
    var itemMax = 10
    
    var weather : Weather? {
        didSet {
            guard let weather = weather else {
                return
            }
            
            if let forecastday = weather.days?.forecastday {
                items = forecastday
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            DispatchQueue.main.async {
                
                self.time.text = weather.location?.localtime
                
                if let temper = weather.current?.temp_c {
                    self.temperature.text = String(describing: temper )
                }
                
                if let icon = weather.current?.condition?.icon {
                    let arr = icon.components(separatedBy: "/")
                    if var iconName = arr.last?.components(separatedBy: ".").first {
                        if arr[arr.count - 2] == "night"
                        {
                            iconName = "\(String(describing: iconName)) 1"
                        }
                        self.imgView.image = UIImage(named: iconName)
                    }
                }
            }
        }
    }
    private var items = [Forecastday]()
    
    let topView = View()
    let collectionView = MyCollectionView(scrollDirection: .horizontal)
    
    let time = MyLabel("", font: .systemFont(ofSize: 14), textColor: Color.textBlack, textAlignment: .center, numberOfLines: 0)
    let temperature = MyLabel("", font: .systemFont(ofSize: 14), textColor: Color.textBlack, textAlignment: .center, numberOfLines: 0)
    
    let imgView = MyImageView(image: UIImage(named: "113"), contentMode: .scaleAspectFit)
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(topView)
        addSubview(collectionView)
        
        topView.addSubview(imgView)
        topView.addSubview(time)
        topView.addSubview(temperature)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        time.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            topView.bottomAnchor.constraint(equalTo: centerYAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imgView.topAnchor.constraint(equalTo: topView.topAnchor, constant: Padding.s),
            imgView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: Padding.s),
            imgView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -Padding.s),
            imgView.bottomAnchor.constraint(equalTo: temperature.topAnchor, constant: -Padding.s),
            
            temperature.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: Padding.s),
            temperature.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -Padding.s),
            temperature.bottomAnchor.constraint(equalTo: time.topAnchor, constant: -Padding.l),
            
            time.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: Padding.s),
            time.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -Padding.s),
            time.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -Padding.s),
        ])
    }
    
    override func style() {
        super.style()
        backgroundColor = .white
        
        let day3 = UIAction(title: "3 days") { (action) in
            self.itemMax = 3
            self.collectionView.reloadData()
        }
        
        let day7 = UIAction(title: "7 days") { (action) in
            self.itemMax = 7
            self.collectionView.reloadData()
        }
        
        let day10 = UIAction(title: "10 days") { (action) in
            self.itemMax = 10
            self.collectionView.reloadData()
        }
        
        menu = UIMenu(title: "Select days count", options: .displayInline, children: [day3 , day7 , day10])
        
        
    }
    
    override func setupTargets() {
        super.setupTargets()
        collectionView.dataSource = self
        collectionView.register(WeatherCell.self, forCellWithReuseIdentifier: WeatherCell.uid)
        
    }
}

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        min(items.count, itemMax)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCell.uid, for: indexPath) as? WeatherCell else {
            fatalError("CatalogueCell not registred")
        }
        
        cell.model = items[indexPath.item]
        
        return cell
    }
    
    
}
