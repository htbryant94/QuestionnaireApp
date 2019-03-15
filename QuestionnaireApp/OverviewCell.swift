import UIKit

class OverviewCell: UICollectionViewCell {

  @IBOutlet weak var lakeCheckBox: CheckBox!
  @IBOutlet weak var tackleShopCheckBox: CheckBox!
  
  var hasLake: Bool = false
  var hasTackleShop: Bool = false
  var hasLakeValueChanged: ((Bool) -> Void)?
  var hasTackleShopValueChanged: ((Bool) -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    lakeCheckBox.listener = { [weak self] value in
      self?.hasLakeValueChanged?(value)
    }
    
    tackleShopCheckBox.listener = { [weak self] value in
      self?.hasTackleShopValueChanged?(value)
    }
  }
  
}
