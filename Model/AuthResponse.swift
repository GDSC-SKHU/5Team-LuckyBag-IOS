//
//  AuthResponse.swift
//  LuckyBags_5Team
//
//  Created by 박신영 on 2023/01/24.
//

import Foundation

struct AuthResponse : Codable {
    var token: TokenData
    var user: UserData
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
