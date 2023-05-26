//
//  Stream16ViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/26.
//

import UIKit
import TVVLCKit

class Stream16ViewController: UIViewController, VLCMediaPlayerDelegate{
    @IBOutlet weak var movieView1: UIView!
    @IBOutlet weak var movieView2: UIView!
    @IBOutlet weak var movieView3: UIView!
    @IBOutlet weak var movieView4: UIView!
    @IBOutlet weak var movieView5: UIView!
    @IBOutlet weak var movieView6: UIView!
    @IBOutlet weak var movieView7: UIView!
    @IBOutlet weak var movieView8: UIView!
    @IBOutlet weak var movieView9: UIView!
    @IBOutlet weak var movieView10: UIView!
    @IBOutlet weak var movieView11: UIView!
    @IBOutlet weak var movieView12: UIView!
    @IBOutlet weak var movieView13: UIView!
    @IBOutlet weak var movieView14: UIView!
    @IBOutlet weak var movieView15: UIView!
    @IBOutlet weak var movieView16: UIView!
    
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
    let mediaPlayer10 = VLCMediaPlayer()
    let mediaPlayer11 = VLCMediaPlayer()
    let mediaPlayer12 = VLCMediaPlayer()
    let mediaPlayer13 = VLCMediaPlayer()
    let mediaPlayer14 = VLCMediaPlayer()
    let mediaPlayer15 = VLCMediaPlayer()
    let mediaPlayer16 = VLCMediaPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if !url1Str.isEmpty{
//            let media1 = VLCMedia(url: URL(string: url1Str)!)
//            mediaPlayer1.media = media1
//            mediaPlayer1.delegate = self
//            mediaPlayer1.drawable = self.movieView1
//            mediaPlayer1.play()
//        }
        
        startPlayer(instance: self.mediaPlayer1, url: self.urlArray[0], view: self.movieView1)
        startPlayer(instance: self.mediaPlayer2, url: self.urlArray[1], view: self.movieView2)
        startPlayer(instance: self.mediaPlayer3, url: self.urlArray[2], view: self.movieView3)
        startPlayer(instance: self.mediaPlayer4, url: self.urlArray[3], view: self.movieView4)
        startPlayer(instance: self.mediaPlayer5, url: self.urlArray[4], view: self.movieView5)
        startPlayer(instance: self.mediaPlayer6, url: self.urlArray[5], view: self.movieView6)
        startPlayer(instance: self.mediaPlayer7, url: self.urlArray[6], view: self.movieView7)
        startPlayer(instance: self.mediaPlayer8, url: self.urlArray[7], view: self.movieView8)
        startPlayer(instance: self.mediaPlayer9, url: self.urlArray[8], view: self.movieView9)
        startPlayer(instance: self.mediaPlayer10, url: self.urlArray[9], view: self.movieView10)
        startPlayer(instance: self.mediaPlayer11, url: self.urlArray[10], view: self.movieView11)
        startPlayer(instance: self.mediaPlayer12, url: self.urlArray[11], view: self.movieView12)
        startPlayer(instance: self.mediaPlayer13, url: self.urlArray[12], view: self.movieView13)
        startPlayer(instance: self.mediaPlayer14, url: self.urlArray[13], view: self.movieView14)
        startPlayer(instance: self.mediaPlayer15, url: self.urlArray[14], view: self.movieView15)
        startPlayer(instance: self.mediaPlayer16, url: self.urlArray[15], view: self.movieView16)
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
