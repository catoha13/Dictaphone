//
//  Record.swift
//  Dictaphone
//
//  Created by Артём on 07.05.2022.
//

import Foundation

class Record: Codable {
    
    var name: String
    var duration: Int
    var date: Date
    
    init(name: String, duration: Int, date: Date) {
        self.name = name
        self.duration = duration
        self.date = date
    }
    
    public enum CodingKeys: String, CodingKey {
        case name, duration, date
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.duration = try container.decode(Int.self, forKey: .duration)
        self.date = try container.decode(Date.self, forKey: .date)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.duration, forKey: .duration)
        try container.encode(self.date, forKey: .date)
    }
}
