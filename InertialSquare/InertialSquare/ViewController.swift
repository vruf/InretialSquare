//
//  ViewController.swift
//  InertialSquare
//
//  Created by Vadim Rufov on 17.9.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var square = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(self.catchClick))
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: view)
    private var snap: UISnapBehavior!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(square)
        square.center.x = view.center.x
        square.center.y = view.center.y
        
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func catchClick(sender : UITapGestureRecognizer) {
        let point = gestureRecognizer.location(in: view)
        
        if (snap != nil) {
            animator.removeBehavior(snap)
        }

        snap = UISnapBehavior(item: square, snapTo: point)
        animator.addBehavior(snap)
        
    }


}

