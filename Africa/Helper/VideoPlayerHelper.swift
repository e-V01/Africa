//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Y K on 25.01.2024.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(filename: String,  fileFormat: String) -> AVPlayer {
    if Bundle.main.url(forResource: filename, withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: filename, withExtension: fileFormat)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
