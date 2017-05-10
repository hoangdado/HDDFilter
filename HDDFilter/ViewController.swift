//
//  ViewController.swift
//  HDDFilter
//
//  Created by Nguyễn Văn Hoàng on 5/10/17.
//  Copyright © 2017 muvik. All rights reserved.
//

import UIKit
import GPUImage
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var renderView: RenderView!
    var camera: Camera!
    let filter = SepiaToneFilter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        do {
            camera = try Camera(sessionPreset: AVCaptureSessionPresetHigh)
            
//            camera.delegate = self as? CameraDelegate
            
            camera --> filter
            
            filter --> renderView
            
            camera.startCapture()
        } catch {
            fatalError("Could not initialize filter pipeline");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

