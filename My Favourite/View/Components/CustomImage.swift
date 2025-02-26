//
//  CustomImage.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

enum ImageShape: String {
  case circle = "Circle"
  case rectangle = "Rectangle"

  init(_ shapeName: String) {
    self = ImageShape(rawValue: shapeName) ?? .rectangle
  }

  func load() -> some Shape {
    switch self {
    case .circle:
      return AnyShape(Circle())
    case .rectangle:
      return AnyShape(RoundedRectangle(cornerRadius: Constant.Spacing.medium, style: .continuous))
    }
  }
}

struct ImageFrame {
  let widthFrame: CGFloat
  let heightFrame: CGFloat

  static func getFrame(_ ImageShapeType: ImageShape) -> ImageFrame {
    switch ImageShapeType {
    case .circle:
      return ImageFrame(widthFrame: 100, heightFrame: 100)
    case .rectangle:
      return ImageFrame(widthFrame: Constant.Style.viewWidth, heightFrame: 300)
    }
  }
}

struct CustomImage: View {
  var image: String
  var shape: String
  private var resolvedShape: ImageShape {
    ImageShape(shape)
  }

  private var resolvedFrame: ImageFrame {
    ImageFrame.getFrame(resolvedShape)
  }

  var body: some View {
    Image(image)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: resolvedFrame.widthFrame, height: resolvedFrame.heightFrame)
      .overlay(
        resolvedShape.load()
          .stroke(Color(.white), lineWidth: 3.0)
      )
      .shadow(radius: Constant.Spacing.xSmall)
      .clipShape(resolvedShape.load())
  }
}

struct CustomImage_Previews: PreviewProvider {
  static var previews: some View {
    CustomImage(image: "image-1", shape: "Rectangle")
  }
}
