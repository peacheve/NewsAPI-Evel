//
//  ContentView.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
                TabView {
                    NewsListView()
                        .tabItem {
                            Image(systemName: "newspaper")
                            Text("Feed")
                        }
                        .tag(0)
                    
                    ExploreView()
                        .tabItem {
                            Image(systemName: "safari")
                            Text("Explore")
                        }
                        .tag(1)
//
//                    SavedNewsView()
//                        .tabitem {
//                            Image(systemName: "bookmark")
//                            Text("Saved")
//                        }
//                        .tag(2)
//
//                    ProfileView()
//                        .tabitem {
//                            Image(systemName: "person")
//                            Text("Profile")
//                        }
//                        .tag(3)
//
                    }
            }
        //
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
