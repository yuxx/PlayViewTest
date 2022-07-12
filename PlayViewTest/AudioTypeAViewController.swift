import UIKit

class AudioTypeAViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var controlMask: UIImageView!
    @IBOutlet weak var closeButton: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsNameLabel: UILabel!
    @IBOutlet weak var dlButton: UIImageView!
    @IBOutlet weak var playControlButton: UIImageView!
    @IBOutlet weak var volumeControlButton: UIImageView!
    @IBOutlet weak var playSeekBar: UISlider!
    @IBOutlet weak var currentPlayTime: UILabel!
    @IBOutlet weak var endPlayTime: UILabel!
    
    var playControlVC: AudioTypeAPlayControlViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(#function) L:\(#line)")
        // 小川の流れのフリー画像(写真)
        let imageURL = URL(string: "https://www.pakutaso.com/shared/img/thumb/GAK72_kawanonagare_TP_V.jpg")
        print("\(#function) L:\(#line)")
        do {
            print("\(#function) L:\(#line)")
            let imageData = try Data(contentsOf: imageURL!)
            print("\(#function) L:\(#line)")
            backgroundImage.image = UIImage(data: imageData)
            print("\(#function) L:\(#line)")
        }
        catch {
            print("fail to load image")
            return
        }
        print("\(#function) L:\(#line)")

        // ユーザインタラクションの受付を有効化(Storyboard上のUIImageViewに設定してもダメでだったためここで設定)
        backgroundImage.isUserInteractionEnabled = true
//        let tapGestureSelector = Selector("tapGesture:")
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: tapGestureSelector)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        print("\(#function) L:\(#line)")
        backgroundImage.addGestureRecognizer(tapGestureRecognizer)
        print("\(#function) L:\(#line)")

//        // タップが効かないのでスワイプジェスチャレコグナイザを設定してみる
//        let downSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
//        downSwipeGestureRecognizer.direction = .down
//        backgroundImage.addGestureRecognizer(downSwipeGestureRecognizer)

//        playControlVC = AudioTypeAPlayControlViewController()
    }

    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        // todo: implement
        print("You tap out!")
//        UIView.animate(
//                withDuration: 0.3,
//                animations: {
//                    playControlVC.
//                },
//                completion: { isFinished in
//
//                }
//        )
    }

//    @objc func swipeGesture(_ gestureRecognizer: UISwipeGestureRecognizer) {
//        print("You swiped!")
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
