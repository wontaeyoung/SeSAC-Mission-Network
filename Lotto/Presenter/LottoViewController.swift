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
  
  private let manager = APIManager()
  private let lottoPickerView = UIPickerView()
  private let numberList: [Int] = (1...1102).reversed()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
    
    let startNumber = numberList.first!
    let request: APIRequest = getLottoRequest(round: startNumber)
    
    numberLabel.text = "\(startNumber)회차"
    manager.callRequest(request) { lotto in
      self.setLottoResult(lotto)
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    configureBallUIViews()
  }
  
  private func text(row: Int) -> String {
    return "\(numberList[row])회차"
  }
  
  private func getLottoRequest(round: Int) -> APIRequest {
    return APIRequest(
      scheme: .https,
      host: .lotto,
      endpoint: LottoAPIEndpoint.getNumber(round: round)
    )
  }
}

// MARK: - Configure
extension LottoViewController {
  private func setLottoResult(_ lotto: Lotto) {
    ballLabels[0].text = lotto.drwtNo1.description
    ballLabels[1].text = lotto.drwtNo2.description
    ballLabels[2].text = lotto.drwtNo3.description
    ballLabels[3].text = lotto.drwtNo4.description
    ballLabels[4].text = lotto.drwtNo5.description
    ballLabels[5].text = lotto.drwtNo6.description
  }
  
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
    let number: Int = numberList[row]
    let request: APIRequest = getLottoRequest(round: number)
    
    numberLabel.text = text(row: row)
    manager.callRequest(request) { lotto in
      self.setLottoResult(lotto)
    }
  }
  
  func pickerView(
    _ pickerView: UIPickerView,
    titleForRow row: Int,
    forComponent component: Int
  ) -> String? {
    return text(row: row)
  }
}
