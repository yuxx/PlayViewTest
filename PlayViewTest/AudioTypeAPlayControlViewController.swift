
import UIKit

class AudioTypeAPlayControlViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsNameLabel: UILabel!
    @IBOutlet weak var controlMaskImage: UIImageView!
    @IBOutlet weak var progressBar: UISlider!
    @IBOutlet weak var currentPlayTimeLabel: UILabel!
    @IBOutlet weak var maxPlayTimeLabel: UILabel!
    @IBOutlet weak var dlButton: UIImageView!
    @IBOutlet weak var playControlButton: UIImageView!
    @IBOutlet weak var volumeControlPanelButton: UIImageView!
    @IBOutlet weak var closeButton: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "瞑想初心者コース"
        contentsNameLabel.text = "小川のせせらぎ"

        progressBar.value = 0.0
        progressBar.addTarget(self, action: #selector(slideSeekBar(_:)), for: .valueChanged)
//        progressBar.addTarget(self, action: Selector("slideSeekBar:"), for: .valueChanged)
    }

    /*
     シークバー操作時のコールバック
     */
    @objc func slideSeekBar(_ sender: UISlider) {
        // todo: implement
        // todo: 再生場所を変更する
    }


}