//
//  mainTabView.swift
//  InstagramCloneWithSwiftUI
//
//  Created by 김승원 on 7/6/24.
//

import SwiftUI

struct MainTabView: View {
    @State var tabIndex = 0
    
    var body: some View {
        TabView(selection: $tabIndex) {
            // MARK: - Feed View
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            // MARK: - Search View
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            // MARK: - New Post View
            NewPostView(tabIndex: $tabIndex)
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            
            // MARK: - Reals View
            Text("Reals")
                .tabItem {
                    Image(systemName: "movieclapper")
                }
                .tag(3)
            
            // MARK: - Profile View
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
