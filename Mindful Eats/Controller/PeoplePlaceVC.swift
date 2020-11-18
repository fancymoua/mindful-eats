

import UIKit

class PeoplePlaceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadBackgroundImage()
        customizeNavBar()
       
    }
    
    var BGImage = UIImageView()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var locationSelected: String?
    var companionSelected: String?
    
    var locationBool = false
    var peopleBool = false
    
    @IBAction func locationPressed(_ sender: UITapGestureRecognizer) {
        if locationBool == false {
            sender.view?.layer.borderWidth = 3
            sender.view?.layer.borderColor = #colorLiteral(red: 0, green: 0.4156862745, blue: 0.4431372549, alpha: 1)
            locationSelected = sender.name!
            locationBool = true
        } else if locationBool == true {
            sender.view?.layer.borderWidth = 0
            sender.view?.layer.borderColor = nil
            locationSelected = nil
            locationBool = false
        }
    }
    
    @IBAction func companionButtonPressed(_ sender: UITapGestureRecognizer) {
        if peopleBool == false {
            sender.view?.layer.borderWidth = 3
            sender.view?.layer.borderColor = #colorLiteral(red: 0, green: 0.4156862745, blue: 0.4431372549, alpha: 1)
            companionSelected = sender.name!
            peopleBool = true
        } else if peopleBool == true {
            sender.view?.layer.borderWidth = 0
            sender.view?.layer.borderColor = nil
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
        
        BGImage.alpha = 0.8
        
//        BGImage.image = #imageLiteral(resourceName: "gradient2")
        BGImage.image = #imageLiteral(resourceName: "Gradient Background")
        view.sendSubviewToBack(BGImage)
        
    }
    
    func customizeNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .white
    }
}
