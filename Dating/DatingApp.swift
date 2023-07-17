//
//  DatingApp.swift
//  Dating
//
//  Created by Bohlale Manage on 2023/07/17.
//

import SwiftUI

@main
struct DatingAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
          LocationsView()
                .environmentObject(vm)
        }
    }
}
