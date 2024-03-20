//
//  Instruct.swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//

import Foundation

struct Instruct : Codable {
    var category: String?
    var index: Int?
    var title: String?
    var description: String?
    var collapsed: Bool? = false
}

struct InstructData : Codable {
    var category: String?
    var instructs : [Instruct]
}
