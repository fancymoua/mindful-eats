

import UIKit

class PeoplePlaceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBackgroundImage()
        print(locationSelected)
    }
    
    var BGImage = UIImageView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var locationSelected: String?
    var companionSelected: String?
    var locationBool = false
    var peopleBool = false
    
    @IBAction func locationPressed(_ sender: UITapGestureRecognizer) {
        if locationBool == false {
            sender.view?.backgroundColor = .green
            locationSelected = sender.name!
            locationBool = true
        } else if locationBool == true {
            sender.view?.backgroundColor = .white
            locationSelected = nil
            locationBool = false
        }
    }
    
    @IBAction func companionButtonPressed(_ sender: UITapGestureRecognizer) {
        if peopleBool == false {
            sender.view?.backgroundColor = .green
            companionSelected = sender.name!
            peopleBool = true
        } else if locationBool == true {
            sender.view?.backgroundColor = .white
            companionSelected = nil
            peopleBool = false
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if companionSelected == nil || locationSelected == nil {
            
            print("Required field missing")
            let alertController = UIAlertController(title: "Please answer both questions.", message: "", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            let newCheckIn = CheckIn(context: context)
            
            let destVC = storyboard?.instantiateViewController(identifier: "AddFoodsView") as! AddFoodVC
            
            newCheckIn.location = locationSelected
            newCheckIn.companion = companionSelected
        
            destVC.newCheckIn = newCheckIn
            
            show(destVC, sender: self)
        }
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
