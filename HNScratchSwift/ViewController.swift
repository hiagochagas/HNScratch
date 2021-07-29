//
//  ViewController.swift
//  HNScratchSwift
//
//  Created by Hiago Chagas on 29/07/21.
//

import UIKit
import HNScratch

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scratch = HNScratch(imagesAndWidth: UIImage(named: "background.jpg"), scratch: UIImage(named: "scratchable.jpg"), lineWidth: 40)
        let scratchView = scratch?.getScratch()
        view.addSubview(scratchView!)
        scratchView?.translatesAutoresizingMaskIntoConstraints = false
        scratchView?.widthAnchor.constraint(equalToConstant: 250).isActive = true
        scratchView?.heightAnchor.constraint(equalToConstant: 250).isActive = true
        scratchView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scratchView?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
    }


}

