//
//  VideoModel.swift
//  Africa
//
//  Created by Y K on 25.01.2024.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed prop
    var thumbnail: String {
        "video-\(id)"
    }
}
