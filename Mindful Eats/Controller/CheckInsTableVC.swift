

import UIKit

class CheckInsTableVC: UIViewController {
    
    @IBOutlet weak var checkinsTableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        checkinsTableView.dataSource = self
        checkinsTableView.delegate = self
        
        createList()

    }
    
    var checkIns = [CheckIn]()
        
    let happy = Emotion(name: "Happy")
    let sad = Emotion(name: "Sad")
    let mellow = Emotion(name: "Mellow")
    
    func createList() {
        
        let firstCheckIn = CheckIn(date: "10/10/2020", mood: happy)
        let secondCheckIn = CheckIn(date: "10/12/2020", mood: sad)
        let thirdCheckIn = CheckIn(date: "10/15/2020", mood: mellow)
        let fourthCheckIn = CheckIn(date: "10/16/2020", mood: happy)
        let fifthCheckIn = CheckIn(date: "10/17/2020", mood: sad)
        let sixthCheckIn = CheckIn(date: "10/18/2020", mood: mellow)
        
        checkIns.append(firstCheckIn)
        checkIns.append(secondCheckIn)
        checkIns.append(thirdCheckIn)
        checkIns.append(thirdCheckIn)
        checkIns.append(fourthCheckIn)
        checkIns.append(fifthCheckIn)
        
    }

}

extension CheckInsTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkIns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckInCell") as! CheckInCell
        
        let date = checkIns[indexPath.item].date
        let emotion = #imageLiteral(resourceName: "mood_happy")
        
        cell.configCell(date: date, emImage: emotion)
        
        return cell
        
    }
    
 
}
