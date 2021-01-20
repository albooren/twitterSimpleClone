//
//  ViewController.swift
//  bootCamp
//
//  Created by Alperen Kişi on 7.12.2020.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tweettableView: UITableView!
    
    var tweetlast = [String]()
    
    var tweetViewModel = TweetViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tweettableView.register(nib, forCellReuseIdentifier: "TweetTableViewCell")
        tweettableView.delegate = self
        tweettableView.dataSource = self
        setData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setData()
        tweettableView.reloadData()
    }
    
    func setData() {
        let userDefaults = UserDefaults.standard
        if let lastTweetArray = userDefaults.object(forKey: "tweetSend") as? [String] {
            tweetlast = lastTweetArray
        }
    }
    
    @IBAction func tweetButtonClicked(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "toTweeting", sender: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetlast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as? TweetTableViewCell {
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tweetlast.remove(at: indexPath.row)
            if var temp = UserDefaults.standard.object(forKey: "tweetSend") as? [String] {
                temp.remove(at: indexPath.row)
                UserDefaults.standard.set(temp, forKey: "tweetSend")
                tweettableView.deleteRows(at: [indexPath], with: .fade)
                tweettableView.reloadData()
            }
        }
    }
}
