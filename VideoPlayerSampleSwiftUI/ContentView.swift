//
//  ContentView.swift
//  VideoPlayerSampleSwiftUI
//
//  Created by KS on 2020/04/13.
//  Copyright © 2020 KS. All rights reserved.
//

import AVKit
import SwiftUI

struct ContentView: View {
    @State private var fileURL: URL?
    @State private var isPresented = false

    var body: some View {
        Button(action: {
            guard let path = Bundle.main.path(forResource: "file_example_MP4_480_1_5MG", ofType: "mp4") else {
                debugPrint("Video not found")
                return
            }

            self.fileURL = URL(fileURLWithPath: path)
            self.isPresented = true
        }) {
            Text("Button")
        }.sheet(isPresented: $isPresented) {
            MediaPlayerView(url: self.$fileURL)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MediaPlayerView: UIViewControllerRepresentable {
    @Binding var url: URL?

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }

    func updateUIViewController(_ playerViewController: AVPlayerViewController, context: Context) {
        guard let url = url else {
            debugPrint("Url not found")
            return
        }
        let player = AVPlayer(url: url)

        playerViewController.player = player
        player.play()
    }
}
