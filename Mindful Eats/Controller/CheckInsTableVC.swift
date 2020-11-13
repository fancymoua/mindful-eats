

import UIKit
import CoreData

class CheckInsTableVC: UIViewController {
    
    @IBOutlet weak var checkinsTableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        checkinsTableView.dataSource = self
        checkinsTableView.delegate = self
        
        fetchAll()
        
        beginAnimation()
        endingAnimations()
        tableAnimator.startAnimation()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchAll()

        
    }
    
    var checkIns = [CheckIn]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableAnimator = UIViewPropertyAnimator(duration: 1.5, curve: .linear)
        
    func fetchAll() {
        let request : NSFetchRequest<CheckIn> = CheckIn.fetchRequest()
        do {
            checkIns = try context.fetch(request)
            checkinsTableView.reloadData()
        } catch {
            print("Error getting data: \(error)")
        }
    }

}

extension CheckInsTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkIns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckInCell") as! CheckInCell
        
        let date = checkIns[indexPath.row].date
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let finalDate = formatter.string(from: date!)
        
        cell.dateLabel.text = finalDate
        
        var emotionImage = UIImage()
        
        if checkIns[indexPath.row].emotions?.contains("Content") == true {
            emotionImage = #imageLiteral(resourceName: "emotion_happy")
        } else if checkIns[indexPath.row].emotions?.contains("Sad") == true {
            emotionImage = #imageLiteral(resourceName: "emotion_sad")
        } else if checkIns[indexPath.row].emotions?.contains("Exhausted") == true {
            emotionImage = #imageLiteral(resourceName: "emotion_sad")
        } else if checkIns[indexPath.row].emotions?.contains("Sad") == true {
            emotionImage = #imageLiteral(resourceName: "emotion_happy")
        }
        
        cell.emotionImage.image = emotionImage
        cell.configCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destVC = storyboard?.instantiateViewController(identifier: "CheckInDetailView") as! CheckInDetailVC
        
        let foods = checkIns[indexPath.row].foods?.joined(separator: ", ")
        let emotions = checkIns[indexPath.row].emotions!.joined(separator: ", ")
        
        destVC.foods = foods!
        destVC.date = checkIns[indexPath.row].date!
        destVC.emotions = emotions
        
        show(destVC, sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            print("Delete this")
            
            let alertController = UIAlertController(title: "Delete?", message: "", preferredStyle: .alert)
            
            let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { (UIalertaction) in
                let deleteItem = self.checkIns[indexPath.row]
                
                self.context.delete(deleteItem)
                self.saveContext()
                self.fetchAll()
                self.checkinsTableView.reloadData()
            }
            
            alertController.addAction(confirmAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving: \(error)")
        }
    }
}

extension CheckInsTableVC: reloadTableDelegate {
    
    func reloadTable() {
        checkinsTableView.reloadData()
    }
}

extension CheckInsTableVC {
    
    func beginAnimation() {
        
        checkinsTableView.alpha = 0.0
        checkinsTableView.reloadData()
        
        let cells = checkinsTableView.visibleCells
        
        let height = checkinsTableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: height)
        }
        
    }
    
    func endingAnimations() {
        
        let cells = checkinsTableView.visibleCells
        
        var delayCounter = 0
        
        tableAnimator.addAnimations {
            self.checkinsTableView.alpha = 1.0
            
            for cell in cells {
                UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                    cell.transform = CGAffineTransform.identity
                }, completion: nil)
                
                delayCounter += 1
            }
        }
    }
}
