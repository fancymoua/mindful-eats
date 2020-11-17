

import UIKit

class CheckInDetailVC: UIViewController {
    
    @IBOutlet weak var foodsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var emotionsLabel: UILabel!
    @IBOutlet weak var emotionsView: UIView!
    @IBOutlet weak var foodsView: UIView!
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var placeView: UIView!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var date = Date()
    var foods = String()
    var emotions = String()
    var people = String()
    var place = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserInfo()
        
        print(people)
        print(place)
        
        customizeNavBar()
        customizeViews()
    }
    
    func displayDateTime() {
        
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .short
        timeFormatter.timeStyle = .short
        
        timeLabel.text = "\(dateFormatter.string(from: date)) \(timeFormatter.string(from: date))"
        
    }
    
}

extension CheckInDetailVC {
    func loadUserInfo() {
        
        displayDateTime()
        foodsLabel.text = foods
        emotionsLabel.text = emotions
        locationLabel.text = place
        
        if people == "self" {
            peopleLabel.text = "Myself"
        } else if people == "spouse-partner" {
            peopleLabel.text = "Spouse/partner"
        } else if people == "family-friends-coworkers" {
            peopleLabel.text = "Family/friends"
        }
        
    }
}

extension CheckInDetailVC {
    func customizeNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    func customizeViews() {
        emotionsView.layer.cornerRadius = emotionsView.frame.height / 14
        emotionsView.layer.masksToBounds = true
        emotionsView.layer.borderColor = UIColor.lightGray.cgColor
        emotionsView.layer.borderWidth = 1.5
        
        foodsView.layer.cornerRadius = emotionsView.frame.height / 14
        foodsView.layer.masksToBounds = true
        foodsView.layer.borderColor = UIColor.lightGray.cgColor
        foodsView.layer.borderWidth = 1.5
        
        peopleView.layer.borderColor = UIColor.lightGray.cgColor
        peopleView.layer.borderWidth = 1.2
        
        placeView.layer.borderColor = UIColor.lightGray.cgColor
        placeView.layer.borderWidth = 1.2
    }
}
