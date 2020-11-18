protocol reloadTableDelegate {
    func reloadTable()
}

import UIKit

class AddFoodVC: UIViewController {
    
    @IBOutlet weak var foodTextField: UITextField!
    @IBOutlet weak var foodItemsCollectionView: UICollectionView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodItemsCollectionView.delegate = self
        foodItemsCollectionView.dataSource = self

        loadBackgroundImage()
    
    }
    
    var newCheckIn = CheckIn()
    
    var BGImage = UIImageView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var reloadDelegate: reloadTableDelegate?
    var foodItems = [String]()
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        if let food = foodTextField.text {
            foodItems.append(food)
            foodItemsCollectionView.reloadData()
            foodTextField.text = ""
        } else {
            print("Please enter item")
        }
    }
    
    
    @IBAction func saveCheckInButtonPressed(_ sender: Any) {
        
        let dateSelected = datePicker.date
        
        print("dateSelected: \(dateSelected)")
        
        newCheckIn.foods = foodItems
        newCheckIn.date = dateSelected
        
        let destVC = storyboard?.instantiateViewController(identifier: "EmotionsSelectionView") as! EmotionsSelectionVC
    
        destVC.thisCheckIn = newCheckIn
        
        show(destVC, sender: self)
        
    }
    
}

extension AddFoodVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCell", for: indexPath) as! FoodItemCell
        
        cell.foodLabel.text = foodItems[indexPath.row]
        cell.setupUI()
        cell.delegate = self
        
        let item = foodItems[indexPath.row]
        cell.item = item
        
        return cell
        
    }
    
}

extension AddFoodVC: deleteFoodItemDelegate {
    func deleteFoodItem(_ name: String) {
        print(name)
        foodItems.removeAll(where: {name.contains($0)})
        foodItemsCollectionView.reloadData()
    }
}


extension AddFoodVC {
    func loadBackgroundImage() {
        
        view.addSubview(BGImage)
        
        BGImage.translatesAutoresizingMaskIntoConstraints = false
        BGImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        BGImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        BGImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        BGImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        BGImage.image = #imageLiteral(resourceName: "Gradient Background")
        view.sendSubviewToBack(BGImage)
        
    }
}
