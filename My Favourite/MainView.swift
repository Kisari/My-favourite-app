//
//  MainView.swift
//  My Favourite
//
//  Created by Minh Trương on 19/07/2023.
//

import SwiftUI

struct MainView: View {
  @State private var showInfo: Bool = false
  @State private var gradientOffsetAnimate: CGFloat = -200.0
  var body: some View {
    NavigationView {
      VStack(spacing: 0) {
        MainViewBackground()
        ZStack {
          VStack {
            MainViewTile()
            MainViewStartButton(gradientOffset: $gradientOffsetAnimate)
            MainViewInstruction(showInfo: $showInfo)
          }
        }
        .frame(width: Constant.Style.viewWidth, height: Constant.Style.viewHeight * 0.5)
        .background(Color("palette-3"))
      }
    }
  }
  
  private struct MainViewBackground: View{
    var body: some View{
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
    }
  }
  
  private struct MainViewTile: View{
    var body: some View{
      VStack (spacing: Constant.Spacing.xMedium){
        VStack {
          Text("My Favourite's")
            .foregroundColor(.white)
            .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.xNormal))
            .frame(maxWidth: Constant.Style.viewWidth, alignment: .leading)
          Text("Food Places")
            .foregroundColor(.white)
            .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.xNormal))
            .frame(maxWidth: Constant.Style.viewWidth, alignment: .leading)
        }
        Text("Eat more, Know more")
          .foregroundColor(.white)
          .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.normal))
          .frame(maxWidth: Constant.Style.viewWidth, alignment: .leading)
          .multilineTextAlignment(.leading)
      }
      .padding(.leading, Constant.Spacing.xxLarge)
      .padding([.bottom, .top], Constant.Spacing.xMedium)
    }
  }
  
  private struct MainViewStartButton: View{
    @Binding var gradientOffset: CGFloat
    
    var body: some View{
      //Navigate to the food view list
      NavigationLink(destination: FoodListView().navigationBarBackButtonHidden(true)) {
        Text("Start")
            .foregroundColor(Color(.white))
            .font(.custom("AbrilFatface-Regular", size: Constant.Spacing.normal))
            .padding(.horizontal, Constant.Spacing.xLarge)
            .padding(.vertical, Constant.Spacing.medium)
            .background(
                RoundedRectangle(cornerRadius: Constant.Spacing.xSmall)
                    .fill(
                        LinearGradient(
                            colors: [Color("palette-4"), Color("palette-3"), Color("palette-4")],
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                    .offset(x: gradientOffset)
                    .blendMode(.screen)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Constant.Spacing.xSmall)
                    .stroke(.white, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: Constant.Spacing.xSmall))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    gradientOffset = 200
                }
            }
      }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
  
  private struct MainViewInstruction: View{
    @Binding var showInfo: Bool
    var body: some View{
      HStack {
        Spacer()
        Button {
          showInfo = true
        } label: {
          Image("info").resizable().frame(width: Constant.Spacing.xMedium, height: Constant.Spacing.xMedium)
        }
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
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
