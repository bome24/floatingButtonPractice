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
    
    @IBAction func floatingButtonAction(_ sender: Any) {
        if isFloating {
            
        }
    }
    
}

