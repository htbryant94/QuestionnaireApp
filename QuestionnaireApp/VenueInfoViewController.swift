import UIKit

class VenueInfoViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var lakeCheckedImageView: UIImageView!
  @IBOutlet weak var tackleShopCheckedImageView: UIImageView!
  @IBOutlet weak var descriptionTextField: UITextField!
  
  
  var name: String?
  var isLake: Bool = false
  var isTackleShop: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func lakeSelected(_ sender: Any) {
    isLake = !isLake
    lakeCheckedImageView.isHidden = !isLake
  }
  
  @IBAction func nameTextFieldDidEndEditing(_ sender: Any) {
    guard let nameText = nameTextField.text else { return }
    if nameText.count > 0 {
      name = nameTextField.text?.capitalized
    } else {
      print("Name field must not be empty")
    }

  }

  @IBAction func tackleShopSelected(_ sender: Any) {
    isTackleShop = !isTackleShop
    tackleShopCheckedImageView.isHidden = !isTackleShop
  }
  
}
