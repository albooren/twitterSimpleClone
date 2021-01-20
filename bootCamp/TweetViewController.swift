//
//  TweetViewController.swift
//  bootCamp
//
//  Created by Alperen Kişi on 8.12.2020.
//

import UIKit

class TweetViewController: UIViewController {
    @IBOutlet weak var tweetTextfield: UITextField!
    @IBOutlet weak var characterCounter: UILabel!
    
    var tweet = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        if let lastTweetArray = userDefaults.object(forKey: "tweetSend") as? [String] {
            tweet = lastTweetArray
        }
    }
    
    @IBAction func sendTweetButtonClicked(_ sender: Any) {
        if tweetTextfield.text?.count == 0 {
            let alert = UIAlertController(title: "Error", message: "Tweet Alanını boş bırakamazsınız", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        } else if Int(tweetTextfield.text?.count ?? 0 ) > 140  {
            let alert = UIAlertController(title: "ERROR", message: "140 karakteri aştınız", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            tweet.append(tweetTextfield.text ?? "")
            let userDefaults = UserDefaults.standard
            userDefaults.setValue(tweet, forKey: "tweetSend")
            navigationController?.popViewController(animated: true)
        }
    }
}
