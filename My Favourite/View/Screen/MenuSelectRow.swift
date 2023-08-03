//
//  MenuSelectRow.swift
//  My Favourite
//
//  Created by Minh Trương on 31/07/2023.
//

import SwiftUI

struct MenuSelectRow: View {
    var location: FoodPlace
    var body: some View {
        HStack(){
            location.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .padding(.trailing, 50)
            VStack(alignment: .leading){
                Text(location.name)
                    .bold()
                    .textCase(.uppercase)
                HStack(){
                    ForEach(location.tags, id: \.self){tag in
                        Text(tag)
                            .font(.system(size: 12))
                            .bold()
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .frame(width: .infinity, height: .infinity)
                            .padding(.all, 3)
                            .background(Color("palette-1"))
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                            
                    }
                }
                
            }
        }
    }
}

struct MenuSelectRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuSelectRow(location: FoodPlaces[0])
    }
}
