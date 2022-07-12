import UIKit

class SwitchStackedUIImageViewController: UIViewController {

    @IBOutlet weak var redImageView: UIImageView!
    @IBOutlet weak var imageMaskView: UIImageView!
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var theButton: UIButton!
    @IBAction func buttonTouch(_ sender: UIButton) {
        print("\(#function) L:\(#line)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 背面が赤いイメージビュー
        redImageView.isUserInteractionEnabled = true

        let tapRedGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapRedImageView(_:)))
        redImageView.addGestureRecognizer(tapRedGestureRecognizer)

        // 全面が半透明な黒いイメージビュー
        imageMaskView.isUserInteractionEnabled = true

        let tapMaskGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapMaskImageView(_:)))
        imageMaskView.addGestureRecognizer(tapMaskGestureRecognizer)
    }

    @objc func tapRedImageView(_ sender: UITapGestureRecognizer) {
        print("\(#function) L:\(#line)")
        // マスクビューを表示する
        UIView.animate(
                withDuration: 1.0,
                animations: {
                    print("\(#function) L:\(#line) appear animate")
                    self.imageMaskView.isHidden = false
                    self.imageMaskView.alpha = 0.75
                    self.theLabel.isHidden = false
                    self.theLabel.alpha = 1.0
                    self.theButton.isHidden = false
                    self.theButton.alpha = 1.0
                    print("\(#function) L:\(#line) appear animate")
                },
                completion: {
                    isFinished in
                    print("\(#function) L:\(#line) appear after")
                })
        print("\(#function) L:\(#line)")
    }

    @objc func tapMaskImageView(_ sender: UITapGestureRecognizer) {
        print("\(#function) L:\(#line) hide image mask")
        // マスクビューを隠す
        UIView.animate(
                withDuration: 1.0,
                animations: {
                    print("\(#function) L:\(#line) hide animate")
                    self.imageMaskView.alpha = 0.0
                    self.theLabel.alpha = 0.0
                    self.theButton.alpha = 0.0
                    print("\(#function) L:\(#line) hide animate")
                },
                completion: {
                    isFinish in
                    print("\(#function) L:\(#line) hide after")
                    self.imageMaskView.isHidden = true
                    self.theLabel.isHidden = true
                    self.theButton.isHidden = true
                    print("\(#function) L:\(#line) hide after")
            }
        )
        print("\(#function) L:\(#line) hide image mask")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
