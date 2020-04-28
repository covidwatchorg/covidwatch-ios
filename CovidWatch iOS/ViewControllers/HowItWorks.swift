//
//  HowItWorks.swift
//  CovidWatch iOS
//
//  Created by Nikhil Kumar on 4/23/20.
//  Copyright © 2020 IZE. All rights reserved.
//

import UIKit

class HowItWorks: UIViewController {
    @IBOutlet weak var page1: UIView!
    @IBOutlet weak var page2: UIView!
    @IBOutlet weak var page3: UIView!
    @IBOutlet weak var page4: UIView!
    @IBOutlet weak var howItWorksLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var setupButton: UIButton!
    @IBOutlet var setupButtonHeight: NSLayoutConstraint!
    @IBOutlet var setupButtonWidth: NSLayoutConstraint!
    @IBOutlet var howItWorksWidth: NSLayoutConstraint!
    @IBOutlet var titleWidth: NSLayoutConstraint!
    @IBOutlet var descriptionWidth: NSLayoutConstraint!

    override func updateViewConstraints() {
        if let setupButtonHeight = self.setupButtonHeight {
            setupButtonHeight.constant = (58.0/321.0) * contentMaxWidth
            setupButtonWidth.constant = contentMaxWidth
        }
        howItWorksWidth.constant = contentMaxWidth
        titleWidth.constant = contentMaxWidth
        descriptionWidth.constant = contentMaxWidth
        super.updateViewConstraints()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // accessibility identifiers
        setupAccessibilityAndLocalization()

        // since screen 4 does not have pages
        if let page1 = self.page1,
            let page2 = self.page2,
            let page3 = self.page3,
            let page4 = self.page4 {
            page1.layer.cornerRadius = 10
            page2.layer.cornerRadius = 10
            page3.layer.cornerRadius = 10
            page4.layer.cornerRadius = 10
        }
        // user has reached last screen
        if let setupButton = self.setupButton {
            setupButton.layer.cornerRadius = 10
            setupButton.titleLabel?.font = Font.button.font(viewHeight: screenHeight)
        }
        howItWorksLabel.font = UIFont(name: "Montserrat", size: 14)
        howItWorksLabel.textColor = UIColor.Primary.Gray
        titleLabel.font = Font.large.font(viewHeight: screenHeight)
        titleLabel.textColor = UIColor.Primary.Gray
        descriptionLabel.font = Font.main.font(viewHeight: screenHeight)
        descriptionLabel.textColor = UIColor.Primary.Gray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let headerViewController = segue.destination as? HeaderViewController {
            headerViewController.delegate = self
        }
    }

    func setupAccessibilityAndLocalization() {
        titleLabel.accessibilityIdentifier = AccessibilityIdentifier.LargeText.rawValue
        descriptionLabel.accessibilityIdentifier = AccessibilityIdentifier.MainText.rawValue
    }
}

// MARK: - Protocol HeaderViewControllerDelegate
extension HowItWorks: HeaderViewControllerDelegate {
    func menuWasTapped() {}
    var shouldShowMenu: Bool { false }
}
