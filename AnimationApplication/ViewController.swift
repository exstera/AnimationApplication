//
//  ViewController.swift
//  AnimationApplication
//
//  Created by Глеб Бельков on 28.04.2024.
//

import Spring

class ViewController: UIViewController {

    
    @IBOutlet weak var coreAnimationView: UIView!
    @IBOutlet weak var SpringAnimationView: SpringView!
    
    private var originCoordinate: CGFloat?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        originCoordinate = coreAnimationView.frame.origin.x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        SpringAnimationView.animation = "fall"
        SpringAnimationView.curve = "easeIn"
        SpringAnimationView.duration = 1
        SpringAnimationView.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
    
    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 20
            }
        }
    }
    
}
