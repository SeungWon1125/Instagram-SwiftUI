//
//  mainTabView.swift
//  InstagramCloneWithSwiftUI
//
//  Created by 김승원 on 7/6/24.
//

import SwiftUI

struct mainTabView: View {
    var body: some View {
        TabView {
            // MARK: - Feed View
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            
            // MARK: - Search View
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            // MARK: - New Post View
            Text("NewPost")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            // MARK: - Reals View
            Text("Reals")
                .tabItem {
                    Image(systemName: "movieclapper")
                }
            
            // MARK: - Profile View
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                }
        }
    }
}

#Preview {
    mainTabView()
}
