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
                            .cornerRadius(Constant.Spacing.normal)
                            .frame(height: 400)
                            .offset(y: -Constant.Spacing.normal)
                            .overlay(
                                VStack {
                                    CustomImage(image: item.imageName, shape: "Circle")
                                        .offset(y: -Constant.Spacing.big)
                                        .padding(.bottom, -Constant.Spacing.big)
                                    Text(item.name)
                                        .font(.system(size: Constant.Spacing.normal))
                                        .bold()
                                        .foregroundColor(.white)
                                    Text(item.address)
                                        .font(.system(size: Constant.Spacing.xMedium))
                                        .foregroundColor(.white)
                                        .padding(.bottom, Constant.Spacing.xLarge)
                                    InfoRow(title: "Walking time", content: "asd")
                                    InfoRow(title: "Distance", content: "asd")
                                        .padding(.bottom, Constant.Spacing.xMedium)
                                    NavigationLink(destination: ItemDetails(item: item).navigationBarBackButtonHidden(true)) {
                                        Text("Explore!")
                                            .frame(width: 300, height: 50)
                                            .background(Color(.red))
                                            .foregroundColor(.white)
                                            .bold()
                                            .clipShape(RoundedRectangle(cornerRadius: Constant.Spacing.xMedium, style: .continuous))
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
