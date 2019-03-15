import UIKit

class CheckBox: UIButton {
  
  let checkedImage = #imageLiteral(resourceName: "checked ")
  var listener: ((Bool) -> Void)?
  
  var isChecked: Bool = false {
    didSet {
      let image = isChecked ? checkedImage : nil
      setBackgroundImage(image, for: .normal)
    }
  }
  
  override func awakeFromNib() {
    addTarget(self,
              action: #selector(buttonPressed(sender:)),
              for: .touchUpInside)
  }
  
  @objc private func buttonPressed(sender: UIButton) {
    isChecked = !isChecked
    listener?(isChecked)
  }
  
}
