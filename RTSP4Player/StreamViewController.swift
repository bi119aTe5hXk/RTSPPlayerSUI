//
//  ViewController.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/05/25.
//

import UIKit
import TVVLCKit

class StreamViewController: UIViewController, VLCMediaPlayerDelegate {
    @IBOutlet weak var movieView1: UIView!
    @IBOutlet weak var movieView2: UIView!
    @IBOutlet weak var movieView3: UIView!
    @IBOutlet weak var movieView4: UIView!
    
    var url1Str:String = ""
    var url2Str:String = ""
    var url3Str:String = ""
    var url4Str:String = ""

    
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
        print("starting player...")
        if url1Str.isEmpty ||
            url2Str.isEmpty ||
            url3Str.isEmpty ||
            url4Str.isEmpty {
            print("URL is empty")
            self.dismiss(animated: true)
            return
        }
        
        
        let media1 = VLCMedia(url: URL(string: url1Str)!)
        let media2 = VLCMedia(url: URL(string: url2Str)!)
        let media3 = VLCMedia(url: URL(string: url3Str)!)
        let media4 = VLCMedia(url: URL(string: url4Str)!)
        
        mediaPlayer1.media = media1
        mediaPlayer2.media = media2
        mediaPlayer3.media = media3
        mediaPlayer4.media = media4
        
        mediaPlayer1.delegate = self
        mediaPlayer2.delegate = self
        mediaPlayer3.delegate = self
        mediaPlayer4.delegate = self
        
        mediaPlayer1.drawable = self.movieView1
        mediaPlayer2.drawable = self.movieView2
        mediaPlayer3.drawable = self.movieView3
        mediaPlayer4.drawable = self.movieView4
        
        mediaPlayer1.play()
        mediaPlayer2.play()
        mediaPlayer3.play()
        mediaPlayer4.play()
    }
    
    


}

