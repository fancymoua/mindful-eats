

import UIKit

class CheckInCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    
    func configCell() {
        
        bgView.layer.cornerRadius = 7
        bgView.layer.opacity = 0.6
        
    }
    
}
