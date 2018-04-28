//
//  ViewController.swift
//  DataPaasing
//
//  Created by Ankit Gabani.
//

import UIKit

//MARK:- Delegate
protocol PizzaDelegate
{
    func onPizzaReady(type: String)
}

class ViewController: UIViewController,PizzaDelegate {

    //MARK:- IBOutlet
    @IBOutlet weak var lblDelegate: UILabel!
    
    @IBOutlet weak var lblText: UILabel!
    
    //MARK:- View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: Notification.Name.myNotificationKey, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //MARK:- Notification
    @objc func onNotification(notification:Notification)
    {
        self.lblText.text = notification.userInfo!["text"] as? String
    }
    
    //MARK:- Delegate
    func onPizzaReady(type: String)
    {
        self.lblDelegate.text = type
    }
    
    //MARK:- Action Method
    @IBAction func btnEdit(_ sender: Any) {
        
        let edit = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as! SecondViewController
        edit.delegate = self
        self.navigationController?.pushViewController(edit, animated: true)
    }
    

}

