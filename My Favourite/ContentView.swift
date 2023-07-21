//
//  ContentView.swift
//  My Favourite
//
//  Created by Minh Trương on 19/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showInfo = false
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    var body: some View {
        VStack(spacing: 0){
            ZStack(){
                Image("view-1-bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
//                Color("palette-0")
                VStack(){
                    Image("logo-white").resizable().aspectRatio(contentMode: .fit).frame(width: 200, height: 200)
                        .padding(.leading, 150)
                        .padding(.bottom, 100)
                }
            }
            .frame(width: screenWidth, height: screenHeight*0.5)
            ZStack(){
                VStack(){
                    VStack(){
                        Text("My Favourite's")
                            .foregroundColor(.white)
                            .font(.custom("AbrilFatface-Regular", size: 28))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Food Places")
                            .foregroundColor(.white)
                            .font(.custom("AbrilFatface-Regular", size: 28))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Eat more, Know more")
                            .foregroundColor(.white)
                            .font(.custom("Zeyada", size: 36))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Button{
                            showInfo = true
                        } label: {
                            Text("Start")
                                .foregroundColor(Color(.white))
                                .font(.custom("AbrilFatface-Regular", size: 26))
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .alert(isPresented: $showInfo){
                            Alert(title: Text("I am Rich"), message: Text("I am rich, I deserve it, I am good, healthy & successful"), dismissButton: .default(Text("Done!")))
                        }
//                        .background(Color.)
                        .cornerRadius(.infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.white, lineWidth: 1))
                        .padding(.leading, -50)
                        
                    }
                    .padding(.leading, 50)
                    .padding([.bottom, .top], 50)
                    HStack(){
                        Spacer()
                        Button{
                            showInfo = true
                        } label: {
                            Image("info").resizable().frame(width: 20, height: 20)
                        }
                        .padding(.all, 5)
                        .alert(isPresented: $showInfo){
                            Alert(title: Text("I am Rich"), message: Text("I am rich, I deserve it, I am good, healthy & successful"), dismissButton: .default(Text("Done!")))
                        }
                        .cornerRadius(.infinity)
                    }
                    .padding([.trailing, .bottom], 50)
                }
            }
            .frame(width: screenWidth,height: screenHeight*0.5)
            .background(Color("palette-3"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
