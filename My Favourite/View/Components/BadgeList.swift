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
      WrappingHStack(tags, id: \.self, alignment: position, lineSpacing: 4) { tag in
            Text(tag.description.capitalized)
                .font(.system(.caption2))
                .foregroundStyle(Color(.white))
                .bold()
                .padding(.all, 4)
                .background(Color("palette-4"))
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        }
    }
}

struct BadgeList_Previews: PreviewProvider {
    static var previews: some View {
      BadgeList(position: .leading, tags: ["test1", "test2", "test1", "test2", "test1", "test2", "test1", "test2", "test1", "test2", "test1", "test2"])
    }
}
