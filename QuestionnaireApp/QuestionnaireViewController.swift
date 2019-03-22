import UIKit

class QuestionnaireViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  var questionnaireData: QuestionnaireData?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(UINib(nibName: "OverviewCell", bundle: nil),
                            forCellWithReuseIdentifier: "OverviewCell")
    collectionView.register(UINib(nibName: "AddressCell", bundle: nil),
                            forCellWithReuseIdentifier: "AddressCell")
    questionnaireData = emptyQuestionnaire()
  }
  
  @IBAction func doneButtonPressed(_ sender: Any) {
    guard let data = questionnaireData else { return }
    handleResponse(data)
  }
  
  private func emptyQuestionnaire() -> QuestionnaireData {
    return QuestionnaireData(overview: OverviewData())
  }
  
//  private func handleEmptyDataError(_ questionnaire: QuestionnaireData) {
//    guard questionnaire.overview?.hasLake != nil,
//          questionnaire.overview?.hasTackleShop != nil,
//          questionnaire.overview?.name != nil else {
//      presentAlert(success: false)
//      return
//    }
//  }
  
  private func handleResponse(_ questionnaire: QuestionnaireData) {
    guard questionnaire.overview?.hasLake != nil,
          questionnaire.overview?.hasTackleShop != nil,
          questionnaire.overview?.name != nil else {
      presentAlert(success: false)
      return
    }
    presentAlert(success: true)
  }
  
  private func presentAlert(success: Bool) {
    let title = success ? "Success" : "There was an Issue"
    let message = success ? "All fields have values" : "One or more fields have been left blank"
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default) { _ in
      alert.dismiss(animated: true, completion: nil)
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
}

struct QuestionnaireData {
  var overview: OverviewData?
}

struct OverviewData {
  var name: String?
  var hasLake: Bool?
  var hasTackleShop: Bool?
}

// MARK: UICollectionViewDataSource
extension QuestionnaireViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section : Int) -> Int {
    return 1
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell: UICollectionViewCell!
    if indexPath.section == 0 {
      if let overviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OverviewCell", for: indexPath) as? OverviewCell {
        cell = configureOverviewCell(overviewCell)
      }
    } else if indexPath.section == 1 {
      cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCell", for: indexPath) as! AddressCell
    }
    return cell
  }

}

// MARK: Cells
extension QuestionnaireViewController: UICollectionViewDelegate {
  
  private func configureOverviewCell(_ cell: OverviewCell) -> OverviewCell {
    cell.hasLakeValueChanged = { [weak self] value in
      print("lake is: \(value)")
      self?.questionnaireData?.overview?.hasLake = value
    }
    cell.hasTackleShopValueChanged = { [weak self] value in
      print("tackle shop is: \(value)")
      self?.questionnaireData?.overview?.hasTackleShop = value
    }
    cell.nameChanged = { [weak self] value in
      print("name changed: \(value!)")
      self?.questionnaireData?.overview?.name = value
    }
    return cell
  }

}

// MARK: UICollectionViewDelegateFlowLayout
extension QuestionnaireViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 {
      return CGSize(width: collectionView.frame.width, height: 200)
    } else if indexPath.section == 1 {
      return CGSize(width: collectionView.frame.width, height: 400)
    }
    return CGSize(width: collectionView.frame.width, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
  }
  
}
