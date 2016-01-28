import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let mediaURL = NSURL(string: "https://download.blender.org/durian/trailer/sintel_trailer-1080p.mp4") {
            let playerItem = AVPlayerItem(URL: mediaURL)
            self.player = AVPlayer(playerItem: playerItem)
            self.player?.play()
        }
    }
}

