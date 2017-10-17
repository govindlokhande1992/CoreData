

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var ageTxt: UITextField!
    @IBOutlet var lastNameTxt: UITextField!
    @IBOutlet var firstNameTxt: UITextField!
    var people: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   // click on save button......
    @IBAction func clickOnSave(_ sender: UIButton) {
        
        
        self.save(firstName: firstNameTxt.text!, lastName: lastNameTxt.text!, age: Int(ageTxt.text!)!)
    }
    
    // save method....
    func save(firstName: String,lastName : String,age : Int) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        // 2
        let entity =
           NSEntityDescription .entity(forEntityName: "Person",
                                       in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        // 3
        person.setValue(firstName, forKeyPath: "firstName")
        person.setValue(lastName, forKeyPath: "lastName")
        person.setValue(age, forKeyPath: "age")
        
        // 4
        do {
            try managedContext.save()
            print("data saved successfully")
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
}

// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

