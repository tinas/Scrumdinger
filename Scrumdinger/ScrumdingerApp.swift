//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Ahmet Tınastepe on 10.03.2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
