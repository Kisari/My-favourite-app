//
//  MenuList.swift
//  My Favourite
//
//  Created by Minh Trương on 20/07/2023.
//

import SwiftUI

struct MenuList: View {
    var body: some View {
        NavigationView(){
            List(){
                Button{
                    print("text")
                }label: {
                    Text("hi")
                }
                
            }
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
