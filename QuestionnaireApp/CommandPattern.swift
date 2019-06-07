/* https://tech.okcupid.com/command-patterns-and-uicollectionview/ */

import UIKit

protocol CollectionViewCellCommand {
  func perform(cell: UICollectionViewCell)
}

struct CollectionViewCellViewModel {
  let identifier: String
  let size: CGSize
  let commands: [CollectionViewCellCommandKey: CollectionViewCellCommand]
}

enum CollectionViewCellCommandKey {
  case configuration
  case cancellation
  case selection
}
