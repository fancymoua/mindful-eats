
import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameButton: CustomAnswerButton!
    @IBOutlet weak var allCheckInsButton: CustomAnswerButton!
    @IBOutlet weak var bottomView: UIView!
    
    var BGImage = UIImageView()
    var userName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomView.layer.cornerRadius = bottomView.frame.width / 14

        avatarImageView.isUserInteractionEnabled = true
        loadBackgroundImage()
        loadUserInfo()
        
        addGestureRecognizerToImageView()
        setUserAvatar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setUserAvatar()
    }
    
    @IBAction func nameButtonPressed(_ sender: Any) {
        showTextField()
    }
    
    func addGestureRecognizerToImageView() {
        let cow = UITapGestureRecognizer(target: self, action: #selector(self.openAvatarSelection))
        avatarImageView.addGestureRecognizer(cow)
    }
    
    @objc func openAvatarSelection() {
        print("Hey it's me")
        performSegue(withIdentifier: "ProfileToAvatarSelection", sender: self)
        
    }
    
    func showTextField() {
        
        let alertController = UIAlertController(title: "Edit Name", message: "", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let textField = alertController.textFields![0]
        textField.text = nameButton.currentTitle
        
        let confirmAction = UIAlertAction(title: "Save", style: .default) { (UIAlertAction) in
            UserDefaults.standard.setValue(textField.text, forKey: "User_name")
            self.nameButton.setTitle(textField.text, for: .normal)
            self.userName = textField.text!
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func setUserAvatar() {
        
        if let userAvatar = UserDefaults.standard.string(forKey: "User_avatar") {
            if userAvatar == "Avatar-1" {
                avatarImageView.image = UIImage(named: "Avatar-1")
            } else if userAvatar == "Avatar-2" {
                avatarImageView.image = UIImage(named: "Avatar-2")
            } else if userAvatar == "Avatar-3" {
                avatarImageView.image = UIImage(named: "Avatar-3")
            } else if userAvatar == "Avatar-4" {
                avatarImageView.image = UIImage(named: "Avatar-4")
            } else if userAvatar == "Avatar-5" {
                avatarImageView.image = UIImage(named: "Avatar-5")
            } else if userAvatar == "Avatar-6" {
                avatarImageView.image = UIImage(named: "Avatar-6")
            }
        }
        
        
    }

}

extension ProfileVC {
    func loadUserInfo() {
        if let userName = UserDefaults.standard.string(forKey: "User_name") {
            nameButton.setTitle(userName, for: .normal)
        } else {
            nameButton.setTitle("Update Name", for: .normal)
            nameButton.titleLabel?.font = UIFont(name: "Avenir Next Italic", size: 14)
        }
    }
}

extension ProfileVC {
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
