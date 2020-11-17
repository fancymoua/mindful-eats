

import UIKit

class PickAvatarVC: UIViewController {
    
  override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        
        let chosenAvatar = sender.name
        UserDefaults.standard.setValue(chosenAvatar, forKey: "User_avatar")
        
        dismiss(animated: true, completion: nil)
    }
    

}
