//
//  AuthRouter.swift
//  LuckyBags_5Team
//
//  Created by 박신영 on 2023/01/24.
//

import Foundation
import Alamofire

// 인증 라우터
// 회원가입, 로그인, 토큰갱신
enum AuthRouter: URLRequestConvertible {
    
    case register(memberId: String, memberPassword: String, nickName: String)
    case login(memberId: String, memberPassword: String)
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .register:
            return "signup"
        case .login:
            return "login"
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .post
        }
    }
    
    var parameters: Parameters{
        switch self {
        case let .login(memberId, memberPassword):
            var params = Parameters()
            params["memberId"] = memberId
            params["memberPassword"] = memberPassword
            return params
            
        case .register(let nickName, let memberId, let memberPassword):
            var params = Parameters()
            params["nickName"] = nickName
            params["memberId"] = memberId
            params["memberPassword"] = memberPassword
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        
        //나는 formdata 가 아닌 raw 인데 httpBody가 맞나?
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        
        return request
    }
    
    
}
