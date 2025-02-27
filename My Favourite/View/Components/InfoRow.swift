//
//  InfoRow.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct InfoRow: View {
  var title: String
  var content: String
  var body: some View {
    Rectangle()
      .fill(Color("palette-4"))
      .frame(width: Constant.Style.viewWidth, height: Constant.Spacing.xLarge)
      .overlay(
        HStack (){
          Text(title)
            .font(.system(size: Constant.Spacing.xMedium))
            .foregroundColor(.white)
          Spacer()
          Text(content)
            .font(.system(size: Constant.Spacing.normal))
            .bold()
            .foregroundColor(.white)
        }
          .padding(.horizontal, Constant.Spacing.medium)
      )
  }
}

struct InfoRow_Previews: PreviewProvider {
  static var previews: some View {
    InfoRow(title: "Distance", content: "100.00")
  }
}
