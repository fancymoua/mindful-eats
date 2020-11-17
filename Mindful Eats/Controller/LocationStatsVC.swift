

import UIKit
import CoreData

class LocationStatsVC: UIViewController {
    
    @IBOutlet weak var homeStatLabel: UILabel!
    @IBOutlet weak var restaurantStatLabel: UILabel!
    @IBOutlet weak var eventStatLabel: UILabel!
    @IBOutlet weak var workStatLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchHomeStat()
        showStats()
    }
    
    var homeArray = [CheckIn]()
    var restaurantArray = [CheckIn]()
    var eventArray = [CheckIn]()
    var workArray = [CheckIn]()
    
    func showStats() {
        homeStatLabel.text = "\(homeArray.count)"
        restaurantStatLabel.text = "\(restaurantArray.count)"
        eventStatLabel.text = "\(eventArray.count)"
        workStatLabel.text = "\(workArray.count)"
    }
}

extension LocationStatsVC {
    func fetchHomeStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "location == %@", "Home")
        request.predicate = predicate
        homeArray = try! context.fetch(request)
    }
    
    func fetchRestaurantStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "location == %@", "Restaurant")
        request.predicate = predicate
        restaurantArray = try! context.fetch(request)
    }
    
    func fetchEventStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "location == %@", "Event")
        request.predicate = predicate
        eventArray = try! context.fetch(request)
    }
    
    func fetchWorkStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "location == %@", "Work")
        request.predicate = predicate
        workArray = try! context.fetch(request)
    }
    
}
