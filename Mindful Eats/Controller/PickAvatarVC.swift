

import UIKit

class PickAvatarVC: UIViewController {
    
  override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        print("Hey")
        let choosenAvatar = sender.name
        UserDefaults.standard.setValue(choosenAvatar, forKey: "User_avatar")
    }
    

}
