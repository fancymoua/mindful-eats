
import UIKit
import CoreData

class PeopleStatsVC: UIViewController {
    
    @IBOutlet weak var aloneStatLabel: UILabel!
    @IBOutlet weak var partnerStatLabel: UILabel!
    @IBOutlet weak var groupStatLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchAloneStat()
        fetchPartnerStat()
        fetchGroupStat()
        showStats()
    }
    
    var aloneArray = [CheckIn]()
    var partnerArray = [CheckIn]()
    var groupArray = [CheckIn]()
    
    func showStats() {
        aloneStatLabel.text = "\(aloneArray.count)"
        partnerStatLabel.text = "\(partnerArray.count)"
        groupStatLabel.text = "\(groupArray.count)"
    }
}

extension PeopleStatsVC {
    
    func fetchAloneStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "companion == %@", "self")
        request.predicate = predicate
        aloneArray = try! context.fetch(request)
    }
    
    func fetchPartnerStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "companion == %@", "spouse-partner")
        request.predicate = predicate
        partnerArray = try! context.fetch(request)
    }
    
    func fetchGroupStat() {
        let request = CheckIn.fetchRequest() as NSFetchRequest<CheckIn>
        let predicate = NSPredicate(format: "companion == %@", "family-friends-coworkers")
        request.predicate = predicate
        groupArray = try! context.fetch(request)
    }
}
