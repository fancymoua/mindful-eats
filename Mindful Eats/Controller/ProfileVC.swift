
import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var nameButton: CustomAnswerButton!
    
    var BGImage = UIImageView()
    var userName = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBackgroundImage()
        
        userName = UserDefaults.standard.string(forKey: "User_name")!
        
        nameButton.setTitle(userName, for: .normal)
        
        print("Value is \(userName)")
    }
    
    @IBAction func nameButtonPressed(_ sender: Any) {
        showTextField()
    }
    
    func showTextField() {
        
        let alertController = UIAlertController(title: "Edit Name", message: "", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let textField = alertController.textFields![0]
        textField.text = userName
        
        let confirmAction = UIAlertAction(title: "Save", style: .default) { (UIAlertAction) in
            print("Saved")
            UserDefaults.standard.setValue(textField.text, forKey: "User_name")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
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
