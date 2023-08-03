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
        NavigationView{
            VStack(spacing: 0){
                ZStack(){
                    Image("view-1-bg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
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
                        }
                        .padding(.leading, 50)
                        .padding([.bottom, .top], 20)
                        NavigationLink(destination: MenuList().navigationBarBackButtonHidden(true)){
                                Text("Start")
                                    .foregroundColor(Color(.white))
                                    .font(.custom("AbrilFatface-Regular", size: 26))
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 15)
                        }
                        .cornerRadius(.infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.white, lineWidth: 1))
                        HStack(){
                            Spacer()
                            Button{
                                showInfo = true
                            } label: {
                                Image("info").resizable().frame(width: 20, height: 20)
                            }
                            .padding(.all, 5)
                            .alert(isPresented: $showInfo){
                                Alert(title: Text("Best food places"), message: Text("Welcome and let enjoy the best food places with real experience all over VietNam cities"), dismissButton: .default(Text("Lets go!")))
                            }
                            .cornerRadius(.infinity)
                        }
                        .padding([.trailing, .bottom], 35)
                    }
                }
                .frame(width: screenWidth,height: screenHeight*0.5)
                .background(Color("palette-3"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
