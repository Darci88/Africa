//
//  VideoModel.swift
//  Africa
//
//  Created by user219285 on 3/28/23.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
