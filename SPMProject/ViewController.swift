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
        
        DispatchQueue.main.async {
            self.onboardingKit = OnboardingKit(
                slide: [
                    .init(image: UIImage(named: "slide1")!, title: "New start"),
                    .init(image: UIImage(named: "slide2")!, title: "Run"),
                    .init(image: UIImage(named: "slide3")!, title: "Inspire"),
                    .init(image: UIImage(named: "slide4")!, title: "Be active"),
                    .init(image: UIImage(named: "slide5")!, title: "Relax")
                ],
                tintColor: UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1.0)
            )
            self.onboardingKit?.delegate = self
            self.onboardingKit?.launchOnboarding(rootVC: self)
        }
    }
}

extension ViewController: OnboardingKitDelegate {
    func nextButtonDidTap(atIndex index: Int) {
        print("next button is tapped at index: \(index)")
    }
    
    func getStartedButtonTap() {
        onboardingKit?.dismissOnboarding()
        onboardingKit = nil
        
        transit(viewController: MainViewController())
    }
    
    private func transit(viewController: UIViewController) {
        let foregroundScenes = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive
        }
        
        let window = foregroundScenes
            .map({ $0 as? UIWindowScene })
            .compactMap({ $0 })
            .first?
            .windows
            .filter({ $0.isKeyWindow })
            .first
        
        guard let uWindow = window else { return }
        uWindow.rootViewController = viewController
        
        UIView.transition(
            with: uWindow,
            duration: 0.3,
            options: [.transitionCrossDissolve],
            animations: nil,
            completion: nil)
    }
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Main View Controller"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        view.backgroundColor = .white
    }
}
