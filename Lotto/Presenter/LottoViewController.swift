//
//  LottoViewController.swift
//  SeSAC-Mission-Network
//
//  Created by 원태영 on 1/16/24.
//

import UIKit

final class LottoViewController: UIViewController {
  
  @IBOutlet weak var numberLabel: UILabel!
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet var ballUIViews: [UIView]!
  @IBOutlet var ballLabels: [UILabel]!
  
  private let lottoPickerView = UIPickerView()
  private let numberList: [Int] = (1...1025).reversed()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    configureBallUIViews()
  }
}

// MARK: - Configure
extension LottoViewController {
  func configureUI() {
    configureNumberLabel()
    configureTextField()
    configureStackView()
    configureBallLabels()
  }
  
  private func configureNumberLabel() {
    numberLabel.font = .boldSystemFont(ofSize: 24)
    numberLabel.textAlignment = .center
  }
  
  private func configureTextField() {
    textField.tintColor = .clear
    textField.borderStyle = .none
    textField.inputView = {
      let picker = UIPickerView()
      picker.delegate = self
      picker.dataSource = self
      
      return picker
    }()
  }
  
  private func configureStackView() {
    stackView.axis = .horizontal
    stackView.spacing = 2
    stackView.distribution = .fillEqually
    stackView.alignment = .center
  }
  
  private func configureBallUIViews() {
    ballUIViews.forEach { view in
      view.backgroundColor = .orange
      view.clipsToBounds = true
      view.layer.cornerRadius = view.bounds.width / 2
    }
  }
  
  private func configureBallLabels() {
    ballLabels.forEach { label in
      label.font = .boldSystemFont(ofSize: 14)
      label.numberOfLines = 1
      label.textAlignment = .center
      label.textColor = .black
    }
  }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(
    _ pickerView: UIPickerView,
    numberOfRowsInComponent component: Int
  ) -> Int {
    return numberList.count
  }
  
  func pickerView(
    _ pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int
  ) {
    numberLabel.text = text(row: row)
  }
  
  func pickerView(
    _ pickerView: UIPickerView,
    titleForRow row: Int,
    forComponent component: Int
  ) -> String? {
    return text(row: row)
  }
  
  private func text(row: Int) -> String {
    return "\(numberList[row])회차"
  }
}
