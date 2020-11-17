

import UIKit

class CheckInDetailVC: UIViewController {
    
    @IBOutlet weak var foodsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var emotionsLabel: UILabel!
    
    var date = Date()
    var foods = String()
    var emotions = String()
    var people = String()
    var place = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodsLabel.text = foods
        emotionsLabel.text = emotions
        
        displayDateTime()
        print(people)
        print(place)
    }
    
    func displayDateTime() {
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        timeFormatter.timeStyle = .short
        
        timeLabel.text = "\(dateFormatter.string(from: date)) \(timeFormatter.string(from: date))"
        
    }
    

    
}
