import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let mediaURL = NSURL(string: "http://stream.taksimbilisim.com:1935/kanal3/bant1/Kanal3.m3u8") {
            let playerItem = AVPlayerItem(URL: mediaURL)
            self.player = AVPlayer(playerItem: playerItem)
            self.player?.play()
            self.videoGravity = AVLayerVideoGravityResizeAspectFill
        }
    }
}
