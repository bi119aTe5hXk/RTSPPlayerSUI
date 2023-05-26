//
//  Stream9ViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/26.
//

import UIKit
import TVVLCKit

class Stream9ViewController: UIViewController, VLCMediaPlayerDelegate {
    @IBOutlet weak var movieView1: UIView!
    @IBOutlet weak var movieView2: UIView!
    @IBOutlet weak var movieView3: UIView!
    @IBOutlet weak var movieView4: UIView!
    @IBOutlet weak var movieView5: UIView!
    @IBOutlet weak var movieView6: UIView!
    @IBOutlet weak var movieView7: UIView!
    @IBOutlet weak var movieView8: UIView!
    @IBOutlet weak var movieView9: UIView!
    
    var urlArray:Array<String>!
    
    let mediaPlayer1 = VLCMediaPlayer()
    let mediaPlayer2 = VLCMediaPlayer()
    let mediaPlayer3 = VLCMediaPlayer()
    let mediaPlayer4 = VLCMediaPlayer()
    let mediaPlayer5 = VLCMediaPlayer()
    let mediaPlayer6 = VLCMediaPlayer()
    let mediaPlayer7 = VLCMediaPlayer()
    let mediaPlayer8 = VLCMediaPlayer()
    let mediaPlayer9 = VLCMediaPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startPlayer(instance: self.mediaPlayer1, url: self.urlArray[0], view: self.movieView1)
        startPlayer(instance: self.mediaPlayer2, url: self.urlArray[1], view: self.movieView2)
        startPlayer(instance: self.mediaPlayer3, url: self.urlArray[2], view: self.movieView3)
        startPlayer(instance: self.mediaPlayer4, url: self.urlArray[3], view: self.movieView4)
        startPlayer(instance: self.mediaPlayer5, url: self.urlArray[4], view: self.movieView5)
        startPlayer(instance: self.mediaPlayer6, url: self.urlArray[5], view: self.movieView6)
        startPlayer(instance: self.mediaPlayer7, url: self.urlArray[6], view: self.movieView7)
        startPlayer(instance: self.mediaPlayer8, url: self.urlArray[7], view: self.movieView8)
        startPlayer(instance: self.mediaPlayer9, url: self.urlArray[8], view: self.movieView9)
    }


    func startPlayer(instance:VLCMediaPlayer, url:String,view:UIView){
        if !url.isEmpty{
            let media = VLCMedia(url: URL(string: url)!)
            instance.media = media
            instance.delegate = self
            instance.drawable = view
            instance.play()
        }else{
            view.isHidden = true
            view.alpha = 0
        }
    }

}
