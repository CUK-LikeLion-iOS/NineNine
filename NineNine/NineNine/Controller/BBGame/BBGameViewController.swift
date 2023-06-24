//
//  BBGameViewController.swift
//  NineNine
//
//  Created by Jinyoung Yoo on 2023/06/01.
//

import UIKit

class BBGameViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var countDownView: UIView!

    let gameData: BBGameData = BBGameData()
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(score)"
        slider.setThumbImage(gameData.fishThumbImage(), for: .normal) // 슬라이더의 thumb가 터치되지 않았을 때
        slider.setThumbImage(gameData.fishThumbImage(), for: .highlighted) // thumb가 터치되었을 때
        
        makeCornerRoundShape(targetView: scoreView, cornerRadius: 20)
        countDownBeforeGame(countDownView: countDownView)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let swipingCatImages = gameData.swipingCatImageArray()
        let image: UIImage = sender.value < 0.5 ? swipingCatImages[0] : swipingCatImages[1]

        if (catImage.image != image) {
            catImage.image = image
            score += 1
            scoreLabel.text = "\(score)"
        }
    }

}