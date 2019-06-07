import UIKit

protocol CollectionViewCellController {
  static func registerCell(for collectionView: UICollectionView)
  func cellFromCollectionView(_ collectionView: UICollectionView, forIndexPath indexPath: IndexPath) -> UICollectionViewCell
  func didSelectCell()
}

class MyCellControllerFactory {
  
  func registerCells(for collectionView: UICollectionView) {
    OverviewCellController.registerCell(for: collectionView)
    AddressCellController.registerCell(for: collectionView)
  }
  
}

class OverviewCellController: CollectionViewCellController {
  
  static var cellIdentifier: String {
    return String(describing: OverviewCell.self)
  }
  
  static func registerCell(for collectionView: UICollectionView) {
    collectionView.register(UINib(nibName: cellIdentifier, bundle: nil),
                            forCellWithReuseIdentifier: cellIdentifier)
  }
  
  func cellFromCollectionView(_ collectionView: UICollectionView, forIndexPath indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: self).cellIdentifier, for: indexPath) as! OverviewCell
    
    return cell
  }
  
  func didSelectCell() {
    
  }
  
}

class AddressCellController: CollectionViewCellController {
  
  static var cellIdentifier: String {
    return String(describing: AddressCell.self)
  }
  
  static func registerCell(for collectionView: UICollectionView) {
    collectionView.register(UINib(nibName: cellIdentifier, bundle: nil),
                            forCellWithReuseIdentifier: cellIdentifier)
  }
  
  func cellFromCollectionView(_ collectionView: UICollectionView, forIndexPath indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of: self).cellIdentifier, for: indexPath) as! AddressCell

    return cell
  }
  
  func didSelectCell() {
    
  }
  
}
