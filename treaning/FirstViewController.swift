//
//  FirstViewController.swift
//  treaning
//
//  Created by 田中 大地 on 2018/11/07.
//  Copyright © 2018 tanaka daichi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    var len: Int = 0
    var enteredNum  = 0
    var copy = ""
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var selectNum: UITextField!
    
    @IBOutlet weak var numberText: UITextField!
    
    @IBOutlet weak var smallText: UITextField!
    
    @IBOutlet weak var bigText: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    var lettersArray: [String]  = ["1234567890","abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ"]
    
    var connectedLetters = ""
    
    // UserDefaults のインスタンス
    var userDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectNum.delegate = self
        textView.delegate = self as? UITextViewDelegate
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func numberButton(_ sender: UISwitch) {
        
        if sender.isOn {
            connectedLetters += lettersArray[0]
            print(connectedLetters)
        }else{
            let range = connectedLetters.range(of: "1234567890")
            connectedLetters = connectedLetters.replacingCharacters(in: range!, with: "")
            print(connectedLetters)
        }
        
    }
    
    @IBAction func smallButton(_ sender: UISwitch) {
        
        if sender.isOn {
            connectedLetters += lettersArray[1]
            print(connectedLetters)
        }else{
            let range = connectedLetters.range(of: "abcdefghijklmnopqrstuvwxyz")
            connectedLetters = connectedLetters.replacingCharacters(in: range!, with: "")
            print(connectedLetters)
        }
    }
    
    @IBAction func bigButton(_ sender: UISwitch) {
        
        if sender.isOn {
            connectedLetters += lettersArray[2]
            print(connectedLetters)
        }else{
            let range = connectedLetters.range(of: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            connectedLetters = connectedLetters.replacingCharacters(in: range!, with: "")
            print(connectedLetters)
        }
    }
    
    @IBAction func copeButton(_ sender: Any) {
        UserDefaults.standard.register(defaults: ["textField4":textView.text ?? ""])
        UserDefaults.standard.set(textView.text,forKey:"textField4")
        UserDefaults.standard.synchronize()
        
//        let next = storyboard!.instantiateViewController(withIdentifier: "nextView") as? ListViewController
//        self.present(next!,animated: true, completion: nil)
        //copy = textView.text
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func pushButton(_ sender: Any) {
        //ifで作る
        enteredNum = Int(selectNum.text!)!
        
        if connectedLetters != ""{
            textView.text = randomString(length: enteredNum )
        } else {
           showAlert(message: "NO")
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        textView.text = ""
        selectNum.text = "0"
        connectedLetters = ""
    }
    
    
    
    
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = connectedLetters as NSString
        len = letters.length
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(UInt32(len))
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        let maxLength = 3
        let str = textField.text! + string
        
        return  (str.count < maxLength) && allowedCharacters.isSuperset(of: characterSet)
    }
}

