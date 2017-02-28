//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by T.K on 2017/02/24.
//  Copyright © 2017年 tadashi.kurino. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var zoom: UIImageView!
    
    var selectedImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        zoom.image = selectedImage
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

