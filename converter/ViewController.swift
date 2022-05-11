//
//  ViewController.swift
//  converter
//
//  Created by Георгий Маркарян on 09.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Night")
        view.contentMode = .scaleAspectFill
        return view
    }()

    var topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Конвертер"
        topLabel.textColor = .white
        topLabel.layer.shadowColor = UIColor.black.cgColor
        topLabel.layer.shadowRadius = 4
        topLabel.layer.shadowOpacity = 0.7
        topLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        topLabel.font = UIFont(name: "Copperplate", size: 50.0)
        return topLabel
    }()

    var celsiusLabel: UILabel = {
        let celsiusLabel = UILabel()
        celsiusLabel.translatesAutoresizingMaskIntoConstraints = false
        celsiusLabel.text = "20 ºC"
        celsiusLabel.textColor = .white
        celsiusLabel.layer.shadowColor = UIColor.black.cgColor
        celsiusLabel.layer.shadowRadius = 4
        celsiusLabel.layer.shadowOpacity = 0.7
        celsiusLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        celsiusLabel.font = UIFont(name: "Copperplate", size: 50.0)
        return celsiusLabel
    }()

    var convertLabel: UILabel = {
        let convertLabel = UILabel()
        convertLabel.translatesAutoresizingMaskIntoConstraints = false
        convertLabel.text = " 68 ºF"
        convertLabel.textColor = .white
        convertLabel.layer.shadowColor = UIColor.black.cgColor
        convertLabel.layer.shadowRadius = 4
        convertLabel.layer.shadowOpacity = 0.7
        convertLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        convertLabel.font = UIFont(name: "Copperplate", size: 50.0)
        return convertLabel
    }()

    var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.maximumValue = 300
        slider.minimumValue = -273
        slider.value = 20
        slider.thumbTintColor = .systemGray
        slider.addTarget(self, action: #selector(sliderAction), for: [.valueChanged])
        return slider
    }()

    var segmebtedControl: UISegmentedControl = {
        let items = ["ºF", "ºK"]
        let segmebtedControl = UISegmentedControl(items: items)

        segmebtedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmebtedControl.selectedSegmentIndex = 0
        segmebtedControl.translatesAutoresizingMaskIntoConstraints = false
        segmebtedControl.layer.shadowColor = UIColor.black.cgColor
        segmebtedControl.layer.shadowRadius = 4
        segmebtedControl.layer.shadowOpacity = 0.7
        segmebtedControl.layer.shadowOffset = CGSize(width: 4, height: 4)
        return segmebtedControl
    }()

      @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
          let tempCelc = Int(slider.value)
          let farTemp = Int ((slider.value*9/5)+32)
          let kelvinTemp = Int(slider.value + 273)
          switch (segmentedControl.selectedSegmentIndex) {
          case 0:
              celsiusLabel.text = "\(tempCelc)ºC"
              convertLabel.text = "\(farTemp)ºF"
          case 1:
              celsiusLabel.text = "\(tempCelc)ºC"
              convertLabel.text = "\(kelvinTemp)ºF"
          default:
              break
          }
      }

    @objc private func sliderAction(){

        let tempCelc = Int(slider.value)
        let farTemp = Int ((slider.value*9/5)+32)
        let kelvinTemp = Int(slider.value + 273)
        switch (segmebtedControl.selectedSegmentIndex) {
        case 0:
            celsiusLabel.text = "\(tempCelc)ºC"
            convertLabel.text = "\(farTemp)ºF"
        case 1:
            celsiusLabel.text = "\(tempCelc)ºC"
            convertLabel.text = "\(kelvinTemp)ºF"
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    func layout(){

        [backgroundImage, topLabel, celsiusLabel, convertLabel, slider, segmebtedControl].forEach {view.addSubview($0)}

        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            segmebtedControl.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            segmebtedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmebtedControl.widthAnchor.constraint(equalToConstant: 100),
            segmebtedControl.heightAnchor.constraint(equalToConstant: 50),

            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            celsiusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            celsiusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            convertLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
            convertLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }

}

