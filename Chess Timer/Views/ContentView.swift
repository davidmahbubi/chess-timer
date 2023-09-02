//
//  ContentView.swift
//  Chess Timer
//
//  Created by David Mahbubi on 02/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MenuView()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
