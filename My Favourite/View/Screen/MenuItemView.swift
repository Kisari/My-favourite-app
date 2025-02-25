//
//  MenuItemView.swift
//  My Favourite
//
//  Created by Minh Trương on 21/07/2023.
//

import CoreLocation
import SwiftUI

struct MenuItem: View {
    let item: FoodPlace
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack {
                        MapView(locationCoordinates: item.locationCoordinate, locationName: item.name)
                            .frame(height: 500)

                        Rectangle()
                            .fill(Color("palette-4"))
                            .cornerRadius(25)
                            .frame(height: 400)
                            .offset(y: -25)
                            .overlay(
                                VStack {
                                    CustomImage(image: item.imageName, shape: "Circle")
                                        .offset(y: -60)
                                        .padding(.bottom, -60)
                                    Text(item.name)
                                        .font(.system(size: 28))
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(item.address)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 40)
                                    InfoRow(title: "Walking time", content: "asd")
                                    InfoRow(title: "Distance", content: "asd")
                                        .padding(.bottom, 20)
                                    NavigationLink(destination: ItemDetails(item: item).navigationBarBackButtonHidden(true)) {
                                        Text("Explore!")
                                            .frame(width: 300, height: 50)
                                            .background(Color(.red))
                                            .foregroundColor(.white)
                                            .bold()
                                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                    }
                                },
                                alignment: .top
                            )
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .scrollDisabled(true)
            }
        }
    }
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem(item: foodTest)
    }
}
