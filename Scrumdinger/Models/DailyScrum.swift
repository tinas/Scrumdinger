//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Ahmet Tınastepe on 11.03.2023.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []
    
    init(data: Data) {
        self.id = UUID()
        self.title = data.title
        self.attendees = data.attendees
        self.lengthInMinutes = Int(data.lengthInMinutes)
        self.theme = data.theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        let name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}

extension DailyScrum {
    private static let data: [Data] = [
        Data(title: "Design", attendees: [Attendee(name: "Cathy"), Attendee(name: "Daisy")], lengthInMinutes: 10, theme: .yellow),
        Data(title: "App Dev", attendees: [Attendee(name: "Katie"), Attendee(name: "Gray")], lengthInMinutes: 5, theme: .orange),
        Data(title: "Web Dev", attendees: [Attendee(name: "Christina"), Attendee(name: "Karla")], lengthInMinutes: 15, theme: .poppy)
    ]
    
    static let sampleData: [DailyScrum] = [
        DailyScrum(data: data[0]),
        DailyScrum(data: data[1]),
        DailyScrum(data: data[2]),
    ]
}
