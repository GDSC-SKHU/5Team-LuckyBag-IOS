//
//  AuthApiService.swift
//  LuckyBags_5Team
//
//  Created by 박신영 on 2023/01/24.
//

import Foundation
import Alamofire
import Combine

// 인증 관련 api 호출
enum AuthApiService {

    // 회원가입
    static func register(memberId: String, memberPassword: String, nickName: String) -> AnyPublisher<UserData, AFError>{
        print("AuthApiService - register() called")
        
        return ApiClient.shared.session
            .request(AuthRouter.register(memberId: memberId, memberPassword: memberPassword, nickName: nickName))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map{ receivedValue in
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
    
    // 로그인
    static func login(memberId: String, memberPassword: String) -> AnyPublisher<UserData, AFError>{
        print("AuthApiService - register() called")
        
        return ApiClient.shared.session
            .request(AuthRouter.login(memberId: memberId, memberPassword: memberPassword))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map{ receivedValue in
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
    
}
