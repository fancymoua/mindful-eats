

import UIKit

protocol deleteFoodItemDelegate {
    func deleteFoodItem(_ position: Int)
}

class FoodItemCell: UICollectionViewCell {
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var item = String()
    var position = Int()
    
    var delegate: deleteFoodItemDelegate?
    
    func setupUI() {
        
        bgView.layer.cornerRadius = 10
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("Delete button pressed")
    }
    
}