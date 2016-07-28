import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {

    let kStatusKey = "status"

    var playerItem: AVPlayerItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let mediaURL = NSURL(string: "http://cdn.ebound.tv/tv/masalatv/chunks.m3u8") {
            playerItem = AVPlayerItem(URL: mediaURL)
            playerItem?.addObserver(self, forKeyPath: kStatusKey, options: [.New, .Initial], context: nil)
            if let playerItem = playerItem {
                self.player = AVPlayer(playerItem: playerItem)
                self.player?.play()
            }
            self.videoGravity = AVLayerVideoGravityResizeAspectFill
        }

        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch { }
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        playerItem?.removeObserver(self, forKeyPath: kStatusKey)
        playerItem = nil
    }

    deinit {
        playerItem?.removeObserver(self, forKeyPath: kStatusKey)
        playerItem = nil
    }

    internal override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {

        if keyPath == kStatusKey, let playerItem = object as? AVPlayerItem {

            print("playerItem.status \(playerItem.status.rawValue)")

            if playerItem.status == .Failed {
                print("playbackDidFail")
            }

            if playerItem.status == .ReadyToPlay {
                print("playbackDidSucceed")
            }

            UIApplication.sharedApplication().idleTimerDisabled = playerItem.status == .ReadyToPlay
        }
    }
}
