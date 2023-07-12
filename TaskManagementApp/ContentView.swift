//
//  ContentView.swift
//  TaskManagementApp
//
//  Created by Bilal SIMSEK on 12.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     Home()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(.BG)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
