//
//  ViewController.swift
//  floatingButtonPractice
//
//  Created by BoMin on 2022/11/01.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var floatingStackView: UIStackView!
  @IBOutlet weak var floatingButton: UIButton!
  @IBOutlet weak var firstButton: UIButton!
  @IBOutlet weak var secondButton: UIButton!
  @IBOutlet weak var thirdButton: UIButton!
    
  lazy var floatingDimView: UIView = {
    let view = UIView(frame: self.view.frame)
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    view.alpha = 0
    view.isHidden = true
    
    self.view.insertSubview(view, belowSubview: self.floatingStackView)
    
    return view
  }()
    
  lazy var buttonList: [UIButton] =
  [
    self.firstButton,
    self.secondButton,
    self.thirdButton,
  ]
    
  var isFloating: Bool = false
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
    
  @IBAction func floatingButtonAction(_ sender: UIButton) {
    if isFloating {
      buttonList.reversed().forEach { button in
        UIView.animate(withDuration: 0.3) {
          button.isHidden = true
          self.view.layoutIfNeeded()
        }
      }
      UIView.animate(withDuration: 0.5, animations: {
        self.floatingDimView.alpha = 0
      }) { (_) in
        self.floatingDimView.isHidden = true
      }
    } else {
      self.floatingDimView.isHidden = false
      UIView.animate(withDuration: 0.5) {
        self.floatingDimView.alpha = 1
      }
      buttonList.forEach { [weak self] button in
        button.isHidden = false
        button.alpha = 0
        UIView.animate(withDuration: 0.3) {
          button.alpha = 1
          self?.view.layoutIfNeeded()
        }
      }
    }
    isFloating = !isFloating
    
    let image = isFloating ? UIImage(named: "Hide") : UIImage(named: "Show")
    let roatation = isFloating ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity
    UIView.animate(withDuration: 0.3) {
      sender.setImage(image, for: .normal)
      sender.transform = roatation
    }
  }
}

