

import UIKit
import CoreData

class FetchControlleerViewController: UIViewController {
    
    @IBOutlet var fetchTableview: UITableView!
    var people : [NSManagedObject] = []
    let identifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTableview.delegate = self
        fetchTableview.dataSource = self
     self.fetchData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // fetching the value from person.......
    
    func fetchData()
    {
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        //3
        do {
            people = try managedContext.fetch(fetchRequest)
            print(people)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

extension FetchControlleerViewController : UITableViewDataSource,UITableViewDelegate
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCell
        if cell == nil{
            tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomTableViewCell
        }
        tableView.separatorStyle = .none
        let person = people[indexPath.row]
        let firstName = person.value(forKey: "firstName")as? String
        let lastName = person.value(forKey: "lastName")as? String
        let fullName = firstName! + "  " + lastName!
        cell?.infoLable.text = fullName
        return cell!
    }
    
}

