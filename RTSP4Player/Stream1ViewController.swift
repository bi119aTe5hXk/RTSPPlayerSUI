//
//  Stream1ViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/26.
//

import UIKit
import TVVLCKit

class Stream1ViewController: UIViewController, VLCMediaPlayerDelegate {
    @IBOutlet weak var movieView: UIView!
    var urlStr: String!
    let mediaPlayer = VLCMediaPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print("url:\(self.urlStr)")
        let media = VLCMedia(url: URL(string: self.urlStr)!)
        mediaPlayer.media = media
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self.movieView
        mediaPlayer.play()
    }

}
