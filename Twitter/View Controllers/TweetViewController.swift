//
//  TweetViewController.swift
//  bhaiTwitter
//
//  Created by Abhishek Saral on 3/12/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetbox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tweet(_ sender: Any) {
        
        if !tweetbox.text.isEmpty {
            TwitterAPICaller.client?.postTweet(tweetString: tweetbox.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet! \(error) *sad face*")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
