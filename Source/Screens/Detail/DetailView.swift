//
//  MainView.swift
//  TestWeather
//
//  Created by User on 25/05/23.
//

import Foundation
import UIKit

class DetailView: View {
    
    var weatherDay : Forecastday? {
        didSet {
            guard let weatherDay = weatherDay else {
                return
            }
            items = weatherDay.hour
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            
            DispatchQueue.main.async {
                
                self.time.text = weatherDay.date
                
                if let temper = weatherDay.day?.avgtemp_c {
                    self.temperature.text = String(describing: temper )
                }
                
                if let icon = weatherDay.day?.condition?.icon {
                    let arr = icon.components(separatedBy: "/")
                    var iconName = arr.last?.components(separatedBy: ".").first
                    if arr[arr.count - 2] == "night"
                    {
                        iconName = "\(String(describing: iconName)) 1"
                    }
                    self.imgView.image = UIImage(named: iconName ?? "")
                }
            }
        }
    }
    private var items = [Hour]()
    
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
            
            //            temperature.topAnchor.constraint(equalTo: topView.centerYAnchor, constant: Padding.s),
            temperature.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: Padding.s),
            temperature.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -Padding.s),
            temperature.bottomAnchor.constraint(equalTo: time.topAnchor, constant: -Padding.l),
            
            //            time.topAnchor.constraint(equalTo: time.bottomAnchor, constant: Padding.s),
            time.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: Padding.s),
            time.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -Padding.s),
            time.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -Padding.s),
        ])
    }
    
    override func style() {
        super.style()
        backgroundColor = .white
    }
    
    override func setupTargets() {
        super.setupTargets()
        collectionView.dataSource = self
        collectionView.register(HourCell.self, forCellWithReuseIdentifier: HourCell.uid)
    }
}

extension DetailView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourCell.uid, for: indexPath) as? HourCell else {
            fatalError("CatalogueCell not registred")
        }
        
        cell.model = items[indexPath.item]
        
        return cell
    }
    
    
}
