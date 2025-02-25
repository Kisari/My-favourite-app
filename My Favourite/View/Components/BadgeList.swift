//
//  BadgeList.swift
//  My Favourite
//
//  Created by Minh Truong on 24/2/25.
//

import SwiftUI
import WrappingHStack

struct BadgeList: View {
    var position: HorizontalAlignment
    var tags: [String]

    var body: some View {
      WrappingHStack(tags, id: \.self, alignment: position, lineSpacing: Constant.Spacing.tiny) { tag in
            Text(tag.description.capitalized)
                .font(.system(.caption2))
                .foregroundStyle(Color(.white))
                .bold()
                .padding(.all, Constant.Spacing.tiny)
                .background(Color("palette-4"))
                .clipShape(RoundedRectangle(cornerRadius: Constant.Spacing.tiny, style: .continuous))
        }
    }
}

struct BadgeList_Previews: PreviewProvider {
    static var previews: some View {
      BadgeList(position: .leading, tags: ["test1", "test2", "test1", "test2", "test1", "test2", "test1", "test2", "test1", "test2", "test1", "test2"])
    }
}
