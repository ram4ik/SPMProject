//
//  ViewController.swift
//  SPMProject
//
//  Created by Ramill Ibragimov on 28.05.2022.
//

import UIKit
import OnboardingKit

class ViewController: UIViewController {

    private var onboardingKit: OnboardingKit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        onboardingKit = OnboardingKit(
            slide: [
                .init(image: UIImage(named: "slide1")!, title: "Start"),
                .init(image: UIImage(named: "slide2")!, title: "Run"),
                .init(image: UIImage(named: "slide3")!, title: "Inspire"),
                .init(image: UIImage(named: "slide4")!, title: "More"),
                .init(image: UIImage(named: "slide5")!, title: "Relax")
            ],
            tintColor: UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1.0)
        )
        onboardingKit?.launchOnboarding(rootVC: self)
    }
}
