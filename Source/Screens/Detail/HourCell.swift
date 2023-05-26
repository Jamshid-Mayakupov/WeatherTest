//
//  WeatherCell.swift
//  WeatherTest
//
//  Created by User on 26/05/23.
//

import UIKit


public class HourCell: MyCollectionViewCell {
    let time = MyLabel("10-15-2023", font: .systemFont(ofSize: 14), textColor: Color.textBlack, textAlignment: .center, numberOfLines: 0)
    let temperature = MyLabel("10-15", font: .systemFont(ofSize: 14), textColor: Color.textBlack, textAlignment: .center, numberOfLines: 0)
    
    let imgView = MyImageView(image: UIImage(named: "sun"), contentMode: .scaleAspectFit)
    
    var model: Hour? {
        didSet {
            time.text = model?.time
            if let temper = model?.temp_c {
                temperature.text = String(describing: temper )
            }
            //imgView.image = UIImage(named: model?.imagePath ?? "sun")
            if let icon = model?.condition?.icon {
                let arr = icon.components(separatedBy: "/")
                if var iconName = arr.last?.components(separatedBy: ".").first {
                    if arr[arr.count - 2] == "night"
                    {
                        iconName = "\(String(describing: iconName)) 1"
                    }
                    imgView.image = UIImage(named: iconName)
                }
            }
        }
    }
    
    public override func setupSubviews() {
        super.setupSubviews()
        
        contentView.addSubview(imgView)
        contentView.addSubview(time)
        contentView.addSubview(temperature)
    }
    
    public override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Padding.s),
            imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.s),
            imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Padding.s),
            
            time.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: Padding.s),
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.s),
            time.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Padding.s),
            
            temperature.topAnchor.constraint(equalTo: time.bottomAnchor, constant: Padding.s),
            temperature.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.s),
            temperature.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Padding.s),
        ])
    }
    
    public override func style() {
        super.style()
        
        backgroundColor = .clear
    }
}

