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
            .frame(width: .infinity, height: 40)
            .overlay(
                HStack(){
                    Text(title)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Text(content)
                        .font(.system(size: 28))
                        .bold()
                        .foregroundColor(.white)
                }
            )
            .padding([.trailing, .leading], 20)
            
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(title: "Distance", content: "100.00")
    }
}
