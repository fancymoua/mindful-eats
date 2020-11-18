

import UIKit

class CheckInCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    func configCell() {
        
        bgView.layer.cornerRadius = 7
        bgView.layer.opacity = 0.5
        bgView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOpacity = 0.8
        bgView.layer.shadowOffset = .zero
        
    }
    
}
