//
//  UIAlertControllerDimmed.swift
//  Candidate
//
//  Created by Jan Schlorf on 24.10.18.
//  Copyright © 2018 Jan Schlorf. All rights reserved.
//

import UIKit

class UIAlertControllerDimmed: UIAlertController {
    
    private var grayOverlayView: UIView?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideGrayOverlay()
    }
    
    func presentWithGrayBackground() {
        showGrayOverlay()
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindowLevelAlert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true, completion: nil)
    }
    
    private func showGrayOverlay() {
        let coloredImage: CIImage = CIImage(image: takeScreenshot())!
        let grayScaleImageCi: CIImage = coloredImage.applyingFilter("CIColorControls", parameters: [kCIInputSaturationKey : 0])
        let grayScaleImage: UIImage = UIImage(ciImage: grayScaleImageCi)
        
        grayOverlayView = UIView(frame: UIApplication.shared.keyWindow!.frame)
        grayOverlayView!.alpha = 0
        let imageView = UIImageView(frame: grayOverlayView!.frame)
        imageView.image = grayScaleImage
        grayOverlayView!.addSubview(imageView)
        UIApplication.shared.keyWindow!.insertSubview(grayOverlayView!, at: 1)
        UIView.animate(withDuration: 0.1, animations: { self.grayOverlayView!.alpha = 1 })
    }
    
    private func hideGrayOverlay() {
        grayOverlayView?.removeFromSuperview()
        grayOverlayView = nil
    }
    
    private func takeScreenshot() -> UIImage {
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return screenshot!
    }
}
