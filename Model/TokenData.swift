//
//  TokenData.swift
//  LuckyBags_5Team
//
//  Created by 박신영 on 2023/01/24.
//

import Foundation
//"token": {
//        "token_type": "Bearer",
//        "expires_in": 30,
//        "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9",
//        "refresh_token": "def5020077bd8b8b4ea3a4fa3d85480afd2bdfafefe85bbf03d8598994bcd48f20120d1f3f5f61538c3a4fe22"
//    }

//"tokenDTO": {
//        "grantType": "Bearer",
//        "accessToken": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJob25neW91bmciLCJhdXRoIjoiUk9MRV9VU0VSIiwiZXhwIjoxNjc0ODYzNDgwfQ.Du4LebsP3SyHqjFrRjM55YF3CXpCm_kADGArlwBNed0",
//        "refreshToken": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NzQ4NjM0ODB9.c80AwX6_CWQz5ieo9aBTC01feQIkwIk3iZeGXxTITy8",
//        "refreshTokenExpirationTime": "2023-01-27T23:51:20.195+00:00"
//    }

// MARK: - TokenData
struct TokenData: Codable {
    let grantType, accessToken, refreshToken, refreshTokenExpirationTime: String
}
