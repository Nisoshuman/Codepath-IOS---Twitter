//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Nisreen Shuman on 9/25/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let tobeFavorited = !favorited
        if (tobeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("favorite did not succeed")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("unfavorite did not succeed")
            })
            
        }
    }
    
    /*@IBAction func retweet(_ sender: Any) {
     TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
         self.setRetweeted(true)
     }, failure: { (error) in
         print("Could not Retweet")
     })
 }*/
    
    @IBAction func retweet(_ sender: Any) {
        let tobeRetweeted = !retweeted
        if (tobeRetweeted){
            TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
                self.setRetweeted(true)
            }, failure: { (error) in
                print("Could not Retweet")
            })
        } else {
            TwitterAPICaller.client?.unretweet(tweetId: tweetId, success: {
                self.setRetweeted(false)
            }, failure: { (error) in
                print("Could not UnRetweet")
            })
        }
        
    }
    
    func setRetweeted(_ isRetweeted:Bool){
        retweeted = isRetweeted
        if (retweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            //retweetButton.isEnabled = false
        }else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            //retweetButton.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
