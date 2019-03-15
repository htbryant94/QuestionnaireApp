import UIKit

class QuestionnaireViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
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
        overviewCell.hasLakeValueChanged = { [weak self] value in
          print("lake is: \(value)")
          self?.questionnaireData?.overview?.hasLake = value
        }
        overviewCell.hasTackleShopValueChanged = { [weak self] value in
          print("tackle shop is: \(value)")
          self?.questionnaireData?.overview?.hasTackleShop = value
        }
        cell = overviewCell
      }
    } else if indexPath.section == 1 {
      cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddressCell", for: indexPath) as! AddressCell
    }
    return cell
  }
  
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
  
  @IBAction func doneButtonPressed(_ sender: Any) {
    guard let data = questionnaireData else { return }
    handleEmptyDataError(data)
  }
  
  private func emptyQuestionnaire() -> QuestionnaireData {
    return QuestionnaireData(overview: OverviewData())
  }
  
  private func handleEmptyDataError(_ questionnaire: QuestionnaireData) {
    guard questionnaire.overview?.hasLake != nil,
          questionnaire.overview?.hasTackleShop != nil else {
      presentAlert()
      return
    }
  }
  
  private func presentAlert() {
    let alert = UIAlertController(title: "There was an issue",
                                  message: "One or more fields have been left blank",
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
