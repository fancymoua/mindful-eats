

import UIKit
import CoreData

class HomeVC: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
    
    var BGImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBackgroundImage()
        checkTime()
        
        getCoreDataDBPath()
        setUserAvatar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
    
    func setUserAvatar() {
        
        if let userAvatar = UserDefaults.standard.string(forKey: "User_avatar") {
            if userAvatar == "Avatar-1" {
                avatarImageView.image = UIImage(named: "Avatar-1-large")
            } else if userAvatar == "Avatar-2" {
                avatarImageView.image = UIImage(named: "Avatar-2-large")
            } else if userAvatar == "Avatar-3" {
                avatarImageView.image = UIImage(named: "Avatar-3-large")
            } else if userAvatar == "Avatar-4" {
                avatarImageView.image = UIImage(named: "Avatar-4-large")
            } else if userAvatar == "Avatar-5" {
                avatarImageView.image = UIImage(named: "Avatar-5-large")
            } else if userAvatar == "Avatar-6" {
                avatarImageView.image = UIImage(named: "Avatar-6-large")
            }
        }
    }
}

extension HomeVC {
    
    func checkTime() {
        let nowRaw = Date()
        
        let midnightRaw = "12:00 am"
        
        let stringToDate = DateFormatter()
        stringToDate.timeStyle = .short
        
        let dateToString = DateFormatter()
        dateToString.timeStyle = .short
        
        let nowString = dateToString.string(from: nowRaw)
        let nowFormattedDate = stringToDate.date(from: nowString)
        
        let midnightFormatted = stringToDate.date(from: midnightRaw)
        
        let duration = nowFormattedDate?.timeIntervalSince(midnightFormatted!)
        
        let durationInt = Int(duration!)
        print("durationInt \(durationInt)")
        
        if durationInt >= 0 && durationInt <= 43199 {
            greetingLabel.text = "Good morning"
        } else if durationInt >= 43200 && durationInt <= 61199 {
            greetingLabel.text = "Good afternoon"
        } else if durationInt >= 61200 {
            greetingLabel.text = "Good evening"
        }
    }
    
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
    
    func getCoreDataDBPath() {
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding

        print("Core Data DB Path :: \(path ?? "Not found")")
    }
    
}

