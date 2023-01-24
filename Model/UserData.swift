//
//  UserData.swift
//  LuckyBags_5Team
//
//  Created by 박신영 on 2023/01/24.
//

import Foundation

struct UserData: Codable {
    var uuid: UUID = UUID()
    var memberID : String
    var memberPassword : String
    var nickName: String

    enum CodingKeys: String, CodingKey {
        case memberID = "memberId"
        case memberPassword = "memberPassword"
        case nickName = "nickName"
    }
}
