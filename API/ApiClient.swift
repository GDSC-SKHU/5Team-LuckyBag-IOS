//
//  ApiClient.swift
//  LuckyBags_5Team
//
//  Created by 박신영 on 2023/01/24.
//

import Foundation
import Alamofire

// api 호출 클라이언트
final class ApiClient {
    
    static let shared = ApiClient()
    
    static let BASE_URL = "http://luckybag2.duckdns.org"
    
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor() // application/json
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session
    
    init() {
        print("ApiClient - init() called")
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
}
