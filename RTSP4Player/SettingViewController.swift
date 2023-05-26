//
//  SettingViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/26.
//

import UIKit
class SettingViewController: UIViewController {
    @IBOutlet weak var urlField1:UITextField!
    @IBOutlet weak var urlField2:UITextField!
    @IBOutlet weak var urlField3:UITextField!
    @IBOutlet weak var urlField4:UITextField!
    
    let userDefaults = UserDefaults.standard
    let kURL1String = "kURL1String"
    let kURL2String = "kURL2String"
    let kURL3String = "kURL3String"
    let kURL4String = "kURL4String"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.urlField1.text = userDefaults.string(forKey: kURL1String)
        self.urlField2.text = userDefaults.string(forKey: kURL2String)
        self.urlField3.text = userDefaults.string(forKey: kURL3String)
        self.urlField4.text = userDefaults.string(forKey: kURL4String)
        
    }
    
    @IBAction func saveAndStartButtonPressed(_ sender: Any) {
        if !self.urlField1.text!.isEmpty &&
            !self.urlField2.text!.isEmpty &&
            !self.urlField3.text!.isEmpty &&
            !self.urlField4.text!.isEmpty{
            
            userDefaults.setValue(self.urlField1.text, forKey: kURL1String)
            userDefaults.setValue(self.urlField2.text, forKey: kURL2String)
            userDefaults.setValue(self.urlField3.text, forKey: kURL3String)
            userDefaults.setValue(self.urlField4.text, forKey: kURL4String)
            
            
        }else{
            let alert = UIAlertController(title: "All field must be filled.", message: nil, preferredStyle: .alert)
            present(alert, animated: true)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "save&start") {
            let streamVC = segue.destination as! StreamViewController
            streamVC.url1Str = self.urlField1.text!
            streamVC.url2Str = self.urlField2.text!
            streamVC.url3Str = self.urlField3.text!
            streamVC.url4Str = self.urlField4.text!
        }
    }
    
    
    
    
    
}
