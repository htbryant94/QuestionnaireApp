import UIKit

class AddressCell: UICollectionViewCell, UITextFieldDelegate {
  
  @IBOutlet weak var streetTextField: UITextField!
  @IBOutlet weak var townTextField: UITextField!
  @IBOutlet weak var countyTextField: UITextField!
  @IBOutlet weak var postCodeTextField: UITextField!
  
  var textFields: [UITextField]?
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
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    textFields?.forEach { textfield in
      textfield.resignFirstResponder()
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    switch textField.tag {
    case 1:
      addressData.street = textField.text
    case 2:
      addressData.town = textField.text
    case 3:
      addressData.county = textField.text
    case 4:
      addressData.postcode = textField.text
    default:
      break
    }
    addressDataListener?(addressData)
  }
  
}



