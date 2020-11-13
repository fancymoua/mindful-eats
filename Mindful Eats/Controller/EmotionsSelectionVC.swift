

import UIKit

class EmotionsSelectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    var thisCheckIn = CheckIn()
    
    var emotionsArray = [String]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func emotionButtonPressed(_ sender: UIButton) {
        
        sender.backgroundColor = .systemGreen
        let emotion = sender.currentTitle
        emotionsArray.append(emotion!)
        
        print("emotionsArray \(emotionsArray)")
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        thisCheckIn.emotions = emotionsArray
        
        saveContext()
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving: \(error)")
        }
    }
    

    

}
