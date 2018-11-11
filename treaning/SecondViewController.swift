//
//  SecondViewController.swift
//  treaning
//
//  Created by 田中 大地 on 2018/11/07.
//  Copyright © 2018 tanaka daichi. All rights reserved.
//

import UIKit
import LocalAuthentication

class SecondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var passList = [""]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "add", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = passList[indexPath.row]
        return cell
    }
    
        var passWord = [String]()
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    
            //arrayというキー値で保存された、配列arrayを取り出す
            if UserDefaults.standard.object(forKey: "passWord") != nil{
                passWord = UserDefaults.standard.object(forKey: "passWord") as! [String]
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
                    return passWord.count
                    
                    
//                    UserDefaults.standard.register(defaults: ["textField4":UITextView.text ])
//                    UserDefaults.standard.set(UITextView.text,forKey:"textField4")
//                    UserDefaults.standard.synchronize()
                    
//                    return passWord.count
    
                }
            }
    
            //tableViewを更新
            tableView.reloadData()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let _: String? = UserDefaults.standard.object(forKey: "passWord") as? String
        
        //print(passData as Any)
        // テーブルサイズを画面いっぱいに
        //tableView.frame = view.frame
        
        // デリゲート
        tableView.delegate = self
        tableView.dataSource = self
        
        // セルをテーブルに紐付ける
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // データのないセルを表示しないようにするハック
        tableView.tableFooterView = UIView(frame: .zero)
        
        // テーブルを表示
        view.addSubview(tableView)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
