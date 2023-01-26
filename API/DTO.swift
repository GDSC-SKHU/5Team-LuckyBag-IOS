//
//  DTO.swift
//  LuckyBags_5Team
//
//  Created by 김하은 on 2023/01/26.
//

import Foundation

struct UserInfo: Codable {
    /*
     id: 아이디
     pwd: 패스워드
     */
    var memberID: String
    var memberPassword: String
    var token: String
    
    init(memberID: String = "", memberPassword: String = "", token:String = "") {
        self.memberID = memberID
        self.memberPassword = memberPassword
        self.token = token
    }
    
    enum CodingKeys: String, CodingKey {
        case memberID = "memberID"
        case memberPassword = "memberPassword"
        case token = "token"
    }
}

struct TokenInfo: Codable {
    init(grantType: String="", accessToken: String="") {
        self.grantType = grantType
        self.accessToken = accessToken
    }
    
    var grantType: String?
    var accessToken: String?
}
