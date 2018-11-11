//
//  ListViewController.swift
//  treaning
//
//  Created by 田中 大地 on 2018/11/09.
//  Copyright © 2018 tanaka daichi. All rights reserved.
//

import UIKit
import LocalAuthentication

class ListViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var idTextField: UITextField!
    
    @IBOutlet weak var passTextFiels: UITextField!
    
    var currentpass: Int = 0
    var correctNum = 0
    var userDefaults = UserDefaults.standard
    
    
    var passWord: [[String: String]] = [
        [
            "name": "",
            "id": "",
            "pass": ""
        ]
        /*[
            "id": "",
            "answer": "",
            "pass": ""
        ],
        [
            "pass": "",
            "answer": "",
            "pass": ""
        ]*/
    ]
    
    // 問題を表示する関数
    func listPass() {
        let passWord = self.passWord[currentpass]
        if passWord["question"] != nil {
           
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        userDefaults.register(defaults: ["DataStore": "default"])
        let maxSpeed: [String] = []
        // 配列の保存
        userDefaults.set(maxSpeed, forKey: "passWord")
        
        guard let obj = UserDefaults.standard.object(forKey: "textField4") else {
            return
        }
        passTextFiels.text = obj as? String
        
        
        
        // viewDidLoad など適切な場所で
        let context = LAContext()
        var error: NSError?
        let description: String = "認証"
        
        // Touch ID・Face IDが利用できるデバイスか確認する
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            print("touchID呼び出し")
            // 利用できる場合は指紋・顔認証を要求する
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: description, reply: {success, evaluateError in
                if (success) {
                    // 認証成功時の処理を書く
                    print("認証成功")
                } else {
                    // 認証失敗時の処理を書く
                    print("認証失敗")
                }
            })
        } else {
            // Touch ID・Face IDが利用できない場合の処理
            let errorDescription = error?.userInfo["NSLocalizedDescription"] ?? ""
            print(errorDescription) // Biometry is not available on this device.
        }
    }
    
    func saveData(str: String){
        
       
        userDefaults.set(str, forKey: "DataStore")
        userDefaults.synchronize()
        
    }
    
    func readData() -> String {
        
        let str: String = userDefaults.object(forKey: "DataStore") as! String
        
        return str
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
        
        if nameTextField.text != "" {
//            var _: Bool = true
            
            //let userDefaults = UserDefaults.standard
            
            if userDefaults.object(forKey: "passWord")  != nil {
                passWord = userDefaults.object(forKey: "passWord") as! [[String : String]]
                passWord.append(["passWord": nameTextField.text!])
                
                userDefaults.set(passWord, forKey: "passWord")
//                passTextFiels.text = ""

                userDefaults.set(passWord, forKey: "passWord")
//                idTextField.text = ""
            }
        
            
            // 共有する項目
            let passwordInfo: String = "ID情報:" + idTextField.text! + "\n名前情報:" + nameTextField.text! + "\nパスワード:" + passTextFiels.text!
//            let nameText: String = nameTextField.text!
//            let passText: String = passTextFiels.text!
            
            
            
            let activityItems = [passwordInfo] as [Any]
            
            if activityItems != nil{
                print("配列の中身",activityItems)
            }
            
            let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
            
            
            // 使用しないアクティビティタイプ
            let excludedActivityTypes = [
                UIActivity.ActivityType.mail,
                UIActivity.ActivityType.postToFacebook,
                UIActivity.ActivityType.postToTwitter,
                UIActivity.ActivityType.message,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.print
            ]
            
            activityVC.excludedActivityTypes = excludedActivityTypes
            
            // UIActivityViewControllerを表示
            self.present(activityVC, animated: true, completion: nil)
//        _ = nameTextField.text
//        _ = idTextField.text
//        _ = passTextFiels.text
//
//        // データ登録
//        if !(nameTextField.text?.isEmpty)! && !(idTextField.text?.isEmpty)! && !(passTextFiels.text?.isEmpty)! {
//
//            UserDefaults.standard.set(nameTextField.text, forKey:"userName")
//            UserDefaults.standard.set(idTextField.text, forKey:"idTextField")
//            UserDefaults.standard.set(passTextFiels.text, forKey:"userPassword")
//        }
        
//        dismiss(animated: true, completion: nil)
//        print("押した")

    }
}
    
    
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
}
