

import UIKit

class CheckInDetailVC: UIViewController {
    
    @IBOutlet weak var foodsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var emotionsLabel: UILabel!
    
    var foods = String()
    var date = Date()
    var emotions = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodsLabel.text = foods
        emotionsLabel.text = emotions
        
        displayDateTime()
    }
    
    func displayDateTime() {
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        timeFormatter.timeStyle = .short
        
        timeLabel.text = "\(dateFormatter.string(from: date)) \(timeFormatter.string(from: date))"
        
    }
    

    
}
