import UIKit

class OverviewCell: UICollectionViewCell, UITextFieldDelegate {

  @IBOutlet weak var lakeCheckBox: CheckBox!
  @IBOutlet weak var tackleShopCheckBox: CheckBox!
  @IBOutlet weak var nameTextField: UITextField!
  
  var hasLake: Bool = false
  var hasTackleShop: Bool = false
  var dataListener: ((QuestionnaireData.OverviewData) -> Void)?
  var data = QuestionnaireData.OverviewData()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    lakeCheckBox.listener = { [weak self] value in
      self?.data.hasLake = value
      guard let data = self?.data else { return }
      self?.dataListener?(data)
    }
    
    tackleShopCheckBox.listener = { [weak self] value in
      self?.data.hasTackleShop = value
      guard let data = self?.data else { return }
      self?.dataListener?(data)
    }
    nameTextField.delegate = self
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    nameTextField.resignFirstResponder()
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    data.name = textField.text
    dataListener?(data)
  }
  
}
