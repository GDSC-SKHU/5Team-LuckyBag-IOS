//
//  RestAPI.swift
//  LuckyBags_5Team
//
//  Created by 김하은 on 2023/01/26.
//

import Foundation

class RestAPI {
    // 로그인
        func POST_Login(userId: String, pwd: String, closure: @escaping (TokenInfo) -> Void) {
            print("정보 보내기")
            let comment = UserInfo(memberID: userId, memberPassword: pwd)
            print(comment)
            
            guard let uploadData = try? JSONEncoder().encode(comment) else {return}
            let url = URL(string: "http://luckybag2.duckdns.org/login")
            
            // URLRequest 객체를 정의
            var request = URLRequest(url: url!)
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")        // the expected response is also JSON
            request.httpMethod = "POST"
            
            // insert json data to the request
            request.httpBody = uploadData
            
            // URLSession 객체를 통해 전송, 응답값 처리
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let json = data {
                    do {
                        let tokenResponse = try JSONDecoder().decode(TokenInfo.self, from: json)
                        print("토근 정보 받아오기")
                        print(tokenResponse.grantType)
                        closure(tokenResponse)
                    } catch {
                        print("토근 정보 못받아옴!")
                        print(error)
                    }
                } else {
                    print("정보 못받아옴!")
                    if let error = error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
}
