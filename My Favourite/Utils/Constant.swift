//
//  Contant.swift
//  My Favourite
//
//  Created by Minh Truong on 25/2/25.
//

import Foundation
import UIKit

public enum Constant {
  public enum Style {
    // nothing
    public static let locationScale: Double = 0.002
    public static let viewWidth: CGFloat = UIScreen.main.bounds.width
    public static let viewHeight: CGFloat = UIScreen.main.bounds.height
  }

  public enum Spacing {
    /// 4
    public static let tiny: CGFloat = 4
    /// 8
    public static let small: CGFloat = 8
    /// 12
    public static let xSmall: CGFloat = 12
    /// 16
    public static let medium: CGFloat = 16
    /// 20
    public static let xMedium: CGFloat = 20
    /// 24
    public static let normal: CGFloat = 24
    /// 32
    public static let xNormal: CGFloat = 32
    /// 36
    public static let large: CGFloat = 36
    /// 40
    public static let xLarge: CGFloat = 40
    /// 48
    public static let xxLarge: CGFloat = 48
    /// 56
    public static let xxxLarge: CGFloat = 56
    /// 64
    public static let big: CGFloat = 64
    /// 72
    public static let huge: CGFloat = 72
  }
}
