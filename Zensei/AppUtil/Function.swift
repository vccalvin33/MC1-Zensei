//
//  Function.swift
//  Zensei
//
//  Created by Shendy Aditya Syamsudin on 12/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation
import UIKit

class Function {
  public static func rotateView(targetView: UIView, duration: Double = 1.0) {
      UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
        targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
      }) { finished in
          self.rotateView(targetView: targetView, duration: duration)
      }
  }
}
