//
//  MenuItem.swift
//  My Favourite
//
//  Created by Minh Trương on 21/07/2023.
//

import SwiftUI
import CoreLocation

struct MenuItem: View {
    let location: FoodPlace
    var body: some View {
            ZStack {
                NavigationStack {
                    ScrollView {
                        VStack{
                            MapView(locationCoordinates: location.locationCoordinate, locationName: location.name)
                                .frame(height: 500)
                        
                            Rectangle()
                                .fill(Color("palette-4"))
                                .cornerRadius(25)
                                .frame(height: 400)
                                .offset(y: -25)
                                .overlay(
                                    VStack(){
                                        CircleImage(image: location.imageName)
                                            .offset(y: -60)
                                            .padding(.bottom, -60)
                                        Text(location.name)
                                            .font(.system(size: 28))
                                            .bold()
                                            .foregroundColor(.white)
                                        Text(location.address)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 40)
                                        InfoRow(title: "Walking time", content: "asd")
                                        InfoRow(title: "Distance", content: "asd")
                                            .padding(.bottom, 20)
                                        NavigationLink(destination: ItemDetails(location: location).navigationBarBackButtonHidden(true)) {
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
        MenuItem(location: FoodPlaces[0])
    }
}
