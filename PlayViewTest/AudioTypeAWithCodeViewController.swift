//
//  AudioATypeViewController.swift
//  PlayViewTest
//

import UIKit
import AVKit

class AudioTypeAWithCodeViewController: UIViewController {

//    var backgroundImage: UIImageView!
    let backgroundImage: UIImageView = {
        return UIImageView(frame: CGRect(
                x: 0, y: 0,
                width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
        ))
    }()
    let controlMaskImage: UIImageView = {
        return  UIImageView(frame: CGRect(
                x: 0, y: 0,
                width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
        ))
    }()

    var contentsTitle: UILabel? = nil
    var trackName: UILabel? = nil
    var seekBar: UISlider? = nil // このUIで合っているか不明。再生用スライダーを追加したい
    var dlButton: UIButton? = nil // 一応UIButtonにしたけどUIImageなのかも
    var playButton: UIButton? = nil // 一応UIButtonにしたけどUIImageなのかも
    var configButton: UIButton? = nil // 一応UIButtonにしたけどUIImageなのかも
    var bgmData: Data? = nil
    var voiceData: Data? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        backgroundImage = UIImageView(frame: CGRect(
//                x: 0, y: 0,
//                width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height
//        ))

        view.backgroundColor = .lightGray
//        let screenSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width:
//        screenSize.width, height: screenSize.height))

        print("\(#function) L:\(#line)")
        // 白い砂浜と宮古島の海のフリー画像(写真)
        let imageURL = URL(string: "https://www.pakutaso.com/shared/img/thumb/TSURU170321-85mm-155_TP_V.jpg")
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
        tapGestureRecognizer.cancelsTouchesInView = false
        print("\(#function) L:\(#line)")
        backgroundImage.addGestureRecognizer(tapGestureRecognizer)
        print("\(#function) L:\(#line)")

        view.addSubview(backgroundImage)
        print("\(#function) L:\(#line)")

        // controlMaskImage
//        imageView.alpha = 0.0
//        imageView.isHidden = true
        controlMaskImage.alpha = 0.5
        controlMaskImage.isHidden = false
        controlMaskImage.backgroundColor = .black
        let closeTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        closeTapGestureRecognizer.cancelsTouchesInView = false
        print("\(#function) L:\(#line)")
        controlMaskImage.addGestureRecognizer(closeTapGestureRecognizer)
        view.addSubview(controlMaskImage)
        print("\(#function) L:\(#line)")

//        // 規定時間が来たらコントロールを隠す(これいらない。こんな要件はない)
//        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block:
//        { _ in
//            print("\(#function) L:\(#line)")
//            self.toggleControls(toAppear: false)
//            print("\(#function) L:\(#line)")
//        })
    }

    func toggleControls(toAppear: Bool) {
        print("\(#function) L:\(#line)")
        print("toAppear: \(toAppear)")
        let toAlpha: CGFloat = toAppear ? 0.5 : 0.0;
        print("toAlpha: \(toAlpha)")
        print("\(#function) L:\(#line)")
        UIView.animate(
                withDuration: 2.0,
                animations: {
                    print("\(#function) L:\(#line)")
                    self.controlMaskImage.alpha = toAlpha
                    print("\(#function) L:\(#line)")
                },
                completion: {
                    isFinish in
                    print("\(#function) L:\(#line)")
                    self.controlMaskImage.isHidden = !toAppear
                    print("\(#function) L:\(#line)")
                }
        )
    }

//    @objc func toggleControlView(_ sender: Timer) {
//        guard sender.userInfo is Bool else {
//            return
//        }
//        let toAppear = sender.userInfo as! Bool
////        guard let toAppear: Bool = sender.userInfo as! Bool else {
////            return
////        }
//        let toAlpha: CGFloat = toAppear ? 0.5 : 0.0;
//        UIView.animate(
//            withDuration: 2.0,
//            animations: {
//                self.controlMaskImage.alpha = toAlpha
//            }, completion: { isFinish in
//                self.controlMaskImage.isHidden = !toAppear
//            }
//        )
//    }

    @objc func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        // todo: implement
        print("You tap out! control display status: \(controlMaskImage.isHidden)")
        if controlMaskImage.isHidden {
            print("\(#function) L:\(#line)")
            toggleControls(toAppear: true)
            print("\(#function) L:\(#line)")
        }
//        controlMaskImage.isHidden = !controlMaskImage.isHidden
    }
}

//class AudioTypeAWithCodeViewController: UIGestureRecognizerDelegate {
//}

