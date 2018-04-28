//
//  SecondViewController.swift
//  DataPaasing
//
//  Created by Ankit Gabani.
//

import UIKit

extension Notification.Name {
    
    public static let myNotificationKey = Notification.Name(rawValue: "myNotificationKey")
}

class SecondViewController: UIViewController {
  
    @IBOutlet weak var txtEdit: UITextField!
    
    var delegate:PizzaDelegate?
    
    //MARK:- View cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func btnSave(_ sender: UIBarButtonItem)
    {
        NotificationCenter.default.post(name: Notification.Name.myNotificationKey, object: nil, userInfo:["text": txtEdit.text]) // Notification
        delegate?.onPizzaReady(type: txtEdit.text!) // Delegate
        
        
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
