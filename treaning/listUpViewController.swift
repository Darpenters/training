//
//  listUpViewController.swift
//  treaning
//
//  Created by 田中 大地 on 2018/11/11.
//  Copyright © 2018 tanaka daichi. All rights reserved.
//

import UIKit

class listUpViewController: UIViewController {
    
    var userDefaults = UserDefaults.standard
    
    var passWord = [String]()
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        //arrayというキー値で保存された、配列arrayを取り出す
//        if UserDefaults.standard.object(forKey: "passWord") != nil{
//            passWord = UserDefaults.standard.object(forKey: "passWord") as! [String]
//            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//                return passWord.count
//
//                UserDefaults.standard.register(defaults: ["textField4":UITextView.text ])
//                UserDefaults.standard.set(UITextView.text,forKey:"textField4")
//                UserDefaults.standard.synchronize()
//
//            }
//        }
//    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("押した")
        
        
    }
    
    @IBAction func memo(_ sender: Any) {
        
        
    }
    
    
    

//        _ = UITextField.text
//        _ = UITextField.text
//
//
//        // データ登録
//        if !(UITextField.text.isEmpty)! && !(UITextField.text?.isEmpty)! {
//
//            UserDefaults.standard.set(UITextField.text, forKey:"userName")
//            UserDefaults.standard.set(UITextField.text, forKey:"idTextField")
//
//        }
        
    
        
    }

