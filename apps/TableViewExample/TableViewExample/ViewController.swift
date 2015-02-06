import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let people = [
        ("Kyle Samson", "Salmon River"),
        ("Lester Samson", "Arichat"),
        ("Mary Samson", "Truro"),
        ("Chad Samson", "Antigonish")
    ]
    
    let sports = [
        ("Hockey", "Blackhawks"),
        ("Football", "Falcons"),
        ("Basketball", "Raptors"),
        ("Soccer", "Chelsea"),
        ("Baseball", "Bluejays")
    ]
    
    // -- How many sections are in the table - return int
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    // -- How many rows are in the table - return int
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //dynically return number of rows based on which table it is populating
        if section == 0 {
            return people.count
        } else {
            return sports.count
        }
    }
    // -- What are the contents of each cell - INDEXPATH = ROW NUMBER
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.section == 0{
            var (personName, personLocation) = people[indexPath.row]
            cell.textLabel?.text = personName
            
        }else{
            var (sportsName, sportsTeam) = sports[indexPath.row]
            cell.textLabel?.text = sportsName
        }
        return cell
    }
    // -- Give each table section a title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "People"
        } else {
            return "Sports"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



}

