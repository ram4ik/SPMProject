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
        onboardingKit = OnboardingKit()
        onboardingKit?.launchOnboarding(rootVC: self)
    }
}
