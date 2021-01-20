//
//  ViewController.swift
//  bootCamp
//
//  Created by Alperen Kişi on 7.12.2020.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TweetViewModelDelegate {
    
    @IBOutlet weak var tweettableView: UITableView!
    
    var tweetViewModel = TweetViewModel()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tweettableView.register(nib, forCellReuseIdentifier: "TweetTableViewCell")
        tweetViewModel.delegate = self
        tweettableView.delegate = self
        tweettableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func tweetButtonClicked(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "toTweeting", sender: nil)
    }
    
    func setTweet(_ tweets: [TweetModel]) {
        tweetViewModel.tweets = tweets
        tweettableView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetViewModel.tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TweetTableViewCell") as? TweetTableViewCell {
            let url = URL(string: tweetViewModel.tweets[indexPath.row].imageUrl ?? "")
            cell.tweetsOwnerImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            cell.tweetsOwnerImageView.sd_setImage(with: url, completed: nil)
            cell.titleNameLabel.text = tweetViewModel.tweets[indexPath.row].username
            cell.tweetingArea.text = tweetViewModel.tweets[indexPath.row].description
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
            tweetViewModel.tweets.remove(at: indexPath.row)
            if var temp = UserDefaults.standard.object(forKey: "tweetSend") as? [String] {
                temp.remove(at: indexPath.row)
                UserDefaults.standard.set(temp, forKey: "tweetSend")
                tweettableView.deleteRows(at: [indexPath], with: .fade)
                tweettableView.reloadData()
            }
        }
    }
}
