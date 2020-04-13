//
//  ViewController.swift
//  VideoPlayerSample
//
//  Created by KS on 2019/05/03.
//  Copyright © 2019 KS. All rights reserved.
//

import AVKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton() {
        guard let path = Bundle.main.path(forResource: "file_example_MP4_480_1_5MG", ofType:"mp4") else {
            debugPrint("Video not found")
            return
        }
        let fileUrl = URL(fileURLWithPath: path)

        VideoPlayer.playVideo(fileUrl: fileUrl, baseViewController: self)
    }
}

final class VideoPlayer {

    static func playVideo(fileUrl: URL, baseViewController: UIViewController) {
        let player = AVPlayer(url: fileUrl)
        let playerController = AVPlayerViewController()

        playerController.player = player

        baseViewController.present(playerController, animated: true) {
            player.play()
        }
    }

    static func playVideo(fileUrl: URL, baseView: UIView) {
        let player = AVPlayer(url: fileUrl)
        let playerLayer = AVPlayerLayer(player: player)

        playerLayer.frame = baseView.bounds
        baseView.layer.addSublayer(playerLayer)

        player.play()
    }
}
