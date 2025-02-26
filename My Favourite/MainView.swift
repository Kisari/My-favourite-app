//
//  MainView.swift
//  My Favourite
//
//  Created by Minh Trương on 19/07/2023.
//

import SwiftUI

struct MainView: View {
  @State private var showInfo = false
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        ZStack {
          Image("image-bg-1")
            .resizable()
            .edgesIgnoringSafeArea(.all)
          VStack {
            Image("logo-text-white")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 200, height: 200)
              .padding(.leading, 150)
              .padding(.bottom, 100)
          }
        }
        .frame(width: Constant.Style.viewWidth, height: Constant.Style.viewHeight * 0.5)
        ZStack {
          VStack {
            VStack {
              Text("My Favourite's")
                .foregroundColor(.white)
                .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.xNormal))
                .frame(maxWidth: .infinity, alignment: .leading)
              Text("Food Places")
                .foregroundColor(.white)
                .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.xNormal))
                .frame(maxWidth: .infinity, alignment: .leading)
              Text("Eat more, Know more")
                .foregroundColor(.white)
                .font(.custom("Zeyada", size: Constant.Spacing.large))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            }
            .padding(.leading, Constant.Spacing.xxLarge)
            .padding([.bottom, .top], Constant.Spacing.xMedium)
            
            //Navigate to the main view
            NavigationLink(destination: FoodListView().navigationBarBackButtonHidden(true)) {
              Text("Start")
                .foregroundColor(Color(.white))
                .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.normal))
                .padding(.horizontal, Constant.Spacing.xLarge)
                .padding(.vertical, Constant.Spacing.medium)
            }
            .cornerRadius(.infinity)
            .navigationViewStyle(StackNavigationViewStyle())
            .overlay(
              RoundedRectangle(cornerRadius: Constant.Spacing.small)
                .stroke(.white, lineWidth: 1))

            HStack {
              Spacer()
              Button {
                showInfo = true
              } label: {
                Image("info").resizable().frame(width: Constant.Spacing.xMedium, height: Constant.Spacing.xMedium)
              }
              .padding(.all, 5)
              .alert(isPresented: $showInfo) {
                Alert(title: Text("Best food places"),
                      message: Text("Welcome and let enjoy the best food places with real experience all over VietNam cities"),
                      dismissButton: Alert.Button.default(
                        Text("Let's go"),
                        action: {}
                      ))
              }
              .cornerRadius(.infinity)
            }
            .padding([.trailing, .bottom], Constant.Spacing.large)
          }
        }
        .frame(width: Constant.Style.viewWidth, height: Constant.Style.viewHeight * 0.5)
        .background(Color("palette-3"))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
