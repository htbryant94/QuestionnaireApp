import UIKit

class OverviewCell: UICollectionViewCell, UITextFieldDelegate {

  @IBOutlet weak var lakeCheckBox: CheckBox!
  @IBOutlet weak var tackleShopCheckBox: CheckBox!
  @IBOutlet weak var nameTextField: UITextField!
  
  var hasLake: Bool = false
  var hasTackleShop: Bool = false
  var hasLakeValueChanged: ((Bool) -> Void)?
  var hasTackleShopValueChanged: ((Bool) -> Void)?
  var nameChanged: ((String?) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    lakeCheckBox.listener = { [weak self] value in
      self?.hasLakeValueChanged?(value)
    }
    
    tackleShopCheckBox.listener = { [weak self] value in
      self?.hasTackleShopValueChanged?(value)
    }
    nameTextField.delegate = self
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    nameTextField.resignFirstResponder()
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    nameChanged?(textField.text)
  }
  
}
