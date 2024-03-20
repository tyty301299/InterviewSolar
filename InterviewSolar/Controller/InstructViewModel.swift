//
//  InstructViewModel.swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//

import Foundation

class InstructViewModel {
    var instructs : [Instruct] = []
    var categorys : Set<String> = []
    var instructsData: [InstructData] = []
    func readFileData() {
        if let fileUrl = Bundle.main.url(forResource: "SolarIOSInterview-2", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let stories = try decoder.decode([Instruct].self, from: data)
                instructs = stories
                categorys = instructs.reduce(into: Set<String>()) { (result, instruct) in
                    result.insert(instruct.category ?? "")
                }
                var categorysArr = categorys.sorted {$0.count > $1.count}
                for category in categorysArr {
                    var result = instructs.filter {$0.category == category}
                    instructsData.append(InstructData(category: result.first?.category ,instructs: result))
                }
            } catch {
                print("Error reading JSON file:", error)
            }
        } else {
            print("😌 Error")
        }
    }
}
