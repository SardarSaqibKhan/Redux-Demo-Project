//
//  Redux_Sample_ProjectApp.swift
//  Redux Sample Project
//
//  Created by sardar saqib on 31/01/2026.
//

import SwiftUI

@main
struct Redux_Sample_ProjectApp: App {
    let store: Store = Store(state: CounterState(counter: 0), reducer: counterReducer)
    var body: some Scene {
        WindowGroup {
            CounterView()
                .environmentObject(store)
        }
    }
}
