
import UIKit

class ProfileVC: UIViewController {
    
    var BGImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBackgroundImage()
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
    
    @IBAction func nameButtonPressed(_ sender: Any) {
        showTextField()
    }
    
    func showTextField() {
        
        let usersName = "Fancy"
        
        let alertController = UIAlertController(title: "Edit Name", message: "", preferredStyle: .alert)
        
        alertController.addTextField()
        
        let textField = alertController.textFields![0]
        textField.text = usersName
        
        let confirmAction = UIAlertAction(title: "Save", style: .default) { (UIAlertAction) in
            print("Saved")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    

}
