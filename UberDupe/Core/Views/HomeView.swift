//
//  HomeView.swift
//  UberDupe
//
//  Created by Raina Wan on 10/2/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea() // display map
    }
}

#Preview {
    HomeView()
}
