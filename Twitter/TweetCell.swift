//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Abhishek Saral on 3/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var markFavoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var tweetID:Int = -1
    var retweeted:Bool = false
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if toBeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Cannot favorite tweet *sad face* \(error) ")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Cannot unfavorite tweet *sad face* \(error)")
            })
        }
        
    }
    
    @IBAction func retweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error cannot retweet \(error)")
        })
        
    }
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if favorited {
            markFavoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        } else {
            markFavoriteButton.setImage(UIImage(named: "favor-icon"), for: .normal)
        }
    }
    
    func setRetweeted (_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if retweeted {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
            retweetButton.isEnabled = true
        }
    }
}
