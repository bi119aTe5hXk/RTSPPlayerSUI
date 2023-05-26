//
//  SettingViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/26.
//

import UIKit
class SettingViewController: UIViewController{
    @IBOutlet weak var urlField1:UITextField!
    @IBOutlet weak var urlField2:UITextField!
    @IBOutlet weak var urlField3:UITextField!
    @IBOutlet weak var urlField4:UITextField!
    @IBOutlet weak var urlField5:UITextField!
    @IBOutlet weak var urlField6:UITextField!
    @IBOutlet weak var urlField7:UITextField!
    @IBOutlet weak var urlField8:UITextField!
    @IBOutlet weak var urlField9:UITextField!
    @IBOutlet weak var urlField10:UITextField!
    @IBOutlet weak var urlField11:UITextField!
    @IBOutlet weak var urlField12:UITextField!
    @IBOutlet weak var urlField13:UITextField!
    @IBOutlet weak var urlField14:UITextField!
    @IBOutlet weak var urlField15:UITextField!
    @IBOutlet weak var urlField16:UITextField!
    @IBOutlet weak var saveAndStartBTN:UIButton!
    
    let userDefaults = UserDefaults.standard
    let kURLArr = "kURLArr"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlArr = userDefaults.array(forKey: kURLArr) as? [String] ?? []
        self.urlField1.text = urlArr[0]
        self.urlField2.text = urlArr[1]
        self.urlField3.text = urlArr[2]
        self.urlField4.text = urlArr[3]
        self.urlField5.text = urlArr[4]
        self.urlField6.text = urlArr[5]
        self.urlField7.text = urlArr[6]
        self.urlField8.text = urlArr[7]
        self.urlField9.text = urlArr[8]
        self.urlField10.text = urlArr[9]
        self.urlField11.text = urlArr[10]
        self.urlField12.text = urlArr[11]
        self.urlField13.text = urlArr[12]
        self.urlField14.text = urlArr[13]
        self.urlField15.text = urlArr[14]
        self.urlField16.text = urlArr[15]
        
        
        
    }
    
    @IBAction func saveAndStartButtonPressed(_ sender: Any) {
        var arr:Array = Array(repeating: "", count: 16)
        
        arr[0] = self.urlField1.text!
        arr[1] = self.urlField2.text!
        arr[2] = self.urlField3.text!
        arr[3] = self.urlField4.text!
        arr[4] = self.urlField5.text!
        arr[5] = self.urlField6.text!
        arr[6] = self.urlField7.text!
        arr[7] = self.urlField8.text!
        arr[8] = self.urlField9.text!
        arr[9] = self.urlField10.text!
        arr[10] = self.urlField11.text!
        arr[11] = self.urlField12.text!
        arr[12] = self.urlField13.text!
        arr[13] = self.urlField14.text!
        arr[14] = self.urlField15.text!
        arr[15] = self.urlField16.text!
        
        userDefaults.setValue(arr, forKey: kURLArr)
        userDefaults.synchronize()
        
        
        
        
        
        var arrCopy = arr
        arrCopy.sort { $1 < $0 }
        
        var itemCount = 0
        for item in arrCopy{
            if !item.isEmpty{
                itemCount += 1
            }
        }
        if itemCount <= 0 {
            let alert = UIAlertController(title: "At least one field is required.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        
        
        //print("arrCopy:\(arrCopy)")
        
        if itemCount == 1{
            print("1 view")
            let stream1VC = storyboard?.instantiateViewController(identifier: "Stream1ViewController") as! Stream1ViewController
            
            stream1VC.urlStr = arrCopy[0]
            self.present(stream1VC, animated: true)
            
        }else if itemCount > 1 && itemCount <= 4{
            print("4 view")
            let stream4VC = storyboard?.instantiateViewController(identifier: "Stream4ViewController") as! Stream4ViewController
            stream4VC.urlArray = arrCopy
            present(stream4VC, animated: true)
            
        }else{
            print("16 view")
            let stream16VC = storyboard?.instantiateViewController(identifier: "Stream16ViewController") as! Stream16ViewController
            stream16VC.urlArray = arr
            present(stream16VC, animated: true)
        }
    }
    
    
}

