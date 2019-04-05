import UIKit

class AddressCell: UICollectionViewCell, UITextFieldDelegate {
  
  @IBOutlet weak var streetTextField: UITextField!
  @IBOutlet weak var townTextField: UITextField!
  @IBOutlet weak var countyTextField: UITextField!
  @IBOutlet weak var postCodeTextField: UITextField!
  
  var textFields: [UITextField]?
  var streetTextChanged: ((String?) -> Void)?
  var townTextChanged: ((String?) -> Void)?
  var countyTextChanged: ((String?) -> Void)?
  var postCodeTextChanged: ((String?) -> Void)?
  var addressDataListener: ((QuestionnaireData.Address) -> Void)?
  var addressData = QuestionnaireData.Address()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    textFields = [streetTextField,
                  townTextField,
                  countyTextField,
                  postCodeTextField]
    
    textFields?.forEach { textfield in
      textfield.delegate = self
    }
    
//    addressData = QuestionnaireData.Address()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textFields?.forEach { textfield in
      textfield.resignFirstResponder()
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    switch textField.tag {
    case 1:
      streetTextChanged?(textField.text)
      addressData.street = textField.text
    case 2:
      townTextChanged?(textField.text)
      addressData.town = textField.text
    case 3:
      countyTextChanged?(textField.text)
      addressData.county = textField.text
    case 4:
      postCodeTextChanged?(textField.text)
      addressData.postcode = textField.text
    default:
      break
    }
    addressDataListener?(addressData)
  }
  
}



