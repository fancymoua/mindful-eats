

import UIKit

class HomeVC: UIViewController {
    
    var BGImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadBackgroundImage()
        
    }
    
    


}

extension HomeVC {
    
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

