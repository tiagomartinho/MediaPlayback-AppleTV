import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let mediaURL = NSURL(string: "https://download.blender.org/durian/trailer/sintel_trailer-1080p.mp4") {
            let asset = AVURLAsset(URL: mediaURL)
            let playerItem = AVPlayerItem(asset: asset)
            let player = AVPlayer(playerItem: playerItem)
            self.player = player
            player.play()
        }
    }
}

