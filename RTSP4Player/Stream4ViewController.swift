//
//  ViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/25.
//

import UIKit
import TVVLCKit

class Stream4ViewController: UIViewController, VLCMediaPlayerDelegate {
    @IBOutlet weak var movieView1: UIView!
    @IBOutlet weak var movieView2: UIView!
    @IBOutlet weak var movieView3: UIView!
    @IBOutlet weak var movieView4: UIView!
    
    var urlArray:Array<String>!

    
    let mediaPlayer1 = VLCMediaPlayer()
    let mediaPlayer2 = VLCMediaPlayer()
    let mediaPlayer3 = VLCMediaPlayer()
    let mediaPlayer4 = VLCMediaPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        startPlayer(instance: self.mediaPlayer1, url: self.urlArray[0], view: self.movieView1)
        startPlayer(instance: self.mediaPlayer2, url: self.urlArray[1], view: self.movieView2)
        startPlayer(instance: self.mediaPlayer3, url: self.urlArray[2], view: self.movieView3)
        startPlayer(instance: self.mediaPlayer4, url: self.urlArray[3], view: self.movieView4)
        
    }
    
    func startPlayer(instance:VLCMediaPlayer, url:String,view:UIView){
        if !url.isEmpty{
            //print(url)
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

