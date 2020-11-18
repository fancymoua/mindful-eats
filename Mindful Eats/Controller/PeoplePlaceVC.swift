

import UIKit

class PeoplePlaceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBackgroundImage()
    }
    
    var BGImage = UIImageView()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var locationSelected = String()
    var companionSelected = String()
    
    @IBAction func locationPressed(_ sender: UITapGestureRecognizer) {
        locationSelected = sender.name!
        print(locationSelected)
    }
    
    @IBAction func companionButtonPressed(_ sender: UITapGestureRecognizer) {
        
        companionSelected = sender.name!
        print(companionSelected)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        let newCheckIn = CheckIn(context: context)
        
        let destVC = storyboard?.instantiateViewController(identifier: "AddFoodsView") as! AddFoodVC
        
        newCheckIn.location = locationSelected
        newCheckIn.companion = companionSelected
    
        destVC.newCheckIn = newCheckIn
        
        show(destVC, sender: self)
    }
    
}

extension PeoplePlaceVC {
    func loadBackgroundImage() {
        
        view.addSubview(BGImage)
        
        BGImage.translatesAutoresizingMaskIntoConstraints = false
        BGImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        BGImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        BGImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        BGImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        BGImage.image = #imageLiteral(resourceName: "Blue Gradient Background")
        view.sendSubviewToBack(BGImage)
        
    }
}
