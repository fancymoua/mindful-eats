

import UIKit

protocol deleteFoodItemDelegate {
    func deleteFoodItem(_ name: String)
}

class FoodItemCell: UICollectionViewCell {
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    var item = String()
    var position = Int()
    
    var delegate: deleteFoodItemDelegate?
    
    func setupUI() {
        
        bgView.layer.cornerRadius = 10
        
        // width of collectionView size base on width of name label (set in storyboard)
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("Delete button pressed")
        print("dafad \(item)")
        delegate?.deleteFoodItem(item)
    }
    
}
