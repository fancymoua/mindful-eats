

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
        
        BGImage.image = #imageLiteral(resourceName: "gradient2")
        view.sendSubviewToBack(BGImage)
        
    }
    
    func customizeNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .white
//        navigationController?.navigationBar.layer.masksToBounds = false
//        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
//        navigationController?.navigationBar.layer.shadowOpacity = 0.8
//        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        navigationController?.navigationBar.layer.shadowRadius = 2
    }
}
