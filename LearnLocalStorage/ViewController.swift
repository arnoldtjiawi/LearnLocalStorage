//
//  ViewController.swift
//  LearnLocalStorage
//
//  Created by Arnold Tjiawi on 04/07/19.
//  Copyright © 2019 ArnoldTjiawi. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NameTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        let Name = UserDefaults.standard.string(forKey: "name")
//        NameLabel.text = Name
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        var users = [User]()
        
        do {
            users = try managedContext.fetch(User.fetchRequest())
            for user in users{
             let namex =  user.value(forKey: "name") as! String
                NameLabel.text! += "\(namex),"
                print(namex)
//                NameLabel.text = namex
            }
            
        } catch  {
            print ("eror")
        }

        
    }

    @IBAction func SaveButton(_ sender: UIButton) {
//   NameLabel.text = NameTextField.text
//        NameTextField.text = ""
//        UserDefaults.standard.setValue(NameLabel.text, forKey: "name")
        
        //Save using core data
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        //2
        let user = User(context: managedContext)
        user.name = NameTextField.text
        do {
            try managedContext.save()
            print("Saved")
        } catch  {
            print("error")
        }
        
        
    }
    
}

