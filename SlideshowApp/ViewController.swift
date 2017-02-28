//
//  ViewController.swift
//  SlideshowApp
//
//  Created by T.K on 2017/02/23.
//  Copyright © 2017年 tadashi.kurino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var timer:Timer? = nil
    
    let imageArray = [
        UIImage(named: "neko1.jpeg"),
        UIImage(named: "neko2.jpeg"),
        UIImage(named: "neko3.jpeg")
    ]
    
    //　画像配列インデックス
    
    var imageIndex = 0
    
    // MARK: Life Cycle -
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 最初にimageindex = 0が代入
        imageView.image = imageArray[imageIndex]
        
        // TODO: イメージのタップイベント追加
        //tap gesture add
        let gesture = UITapGestureRecognizer(target:self, action:#selector(didClickImageView))
        //tap event add
       imageView.addGestureRecognizer(gesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Action -
    
    func didClickImageView(reconizer: UIGestureRecognizer) {
        //gesture objのviewプロパティ(event added UI部品をreconize)をImageviewでキャスト,tap gestureに渡す
        if let ImageView = reconizer.view as? UIImageView {
            
            //戻った時のタイマー考慮
            pauseTimer()
            
            //画面遷移
            let storyboard: UIStoryboard = self.storyboard!
            let nextview = storyboard.instantiateViewController(withIdentifier: "next") as! ZoomViewController
            nextview.selectedImage = ImageView.image
            self.navigationController?.pushViewController(nextview, animated: true)
            
        }
    }

    
    @IBAction func StartShow(_ sender: Any) {
        if self.timer == nil {
            start.setTitle("停止", for: .normal)
            self.timer =
                Timer.scheduledTimer(
                    timeInterval: 2.0,
                    target: self,
                    selector: #selector(updateTimer),
                    userInfo: nil,
                    repeats: true)
        } else {
            pauseTimer()
        }
    }
    
    func pauseTimer() {
        start.setTitle("再生", for: .normal)
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func updateTimer(timer: Timer) {
         showNext(timer)
    }
    
    //画像順次送り 0,1,2 imageArray.count -> 3
    @IBAction func showNext(_ sender: Any) {
        // 配列の最後の要素＝最後の画像のときindex0で最初の位置
        
        if imageIndex == imageArray.count - 1 {
            imageIndex = 0
        } else {
        // その他は次へ押下のたびに配列の次要素インデックスを代入
        imageIndex += 1
        }
        //　画像表示
        imageView.image = imageArray[imageIndex]
    }
    
    //画像逆送り 0 -> imagearray- 1
    @IBAction func pushBackbtn(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = imageArray.count - 1
         } else {
          imageIndex -= 1
         }
        imageView.image = imageArray[imageIndex]
    }

    
    
    @IBAction func unwind(Segue:UIStoryboardSegue) {
        
    }
    
    // MARK: Segue -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let z = segue.destination as! ZoomViewController
        z.selectedImage = imageView.image
    }

}

