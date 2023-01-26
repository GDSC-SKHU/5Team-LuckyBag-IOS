//
//  ex_login.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/09.
//

import SwiftUI


struct LoginView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var shouldShowAlert : Bool = false
    
    
    @State var signInSuccess = false
    
    let restApi = RestAPI()
    @State private var memberID: String = ""
    @State private var memberPassword: String = ""
    @State private var tokenMember = TokenInfo.init()
    //    @State var idInput: String = ""
    //    @State var passwordInput: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("진짜로그인")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer(minLength: 350)
                    HStack {
                        //상단 로그인
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                            .overlay {
                                Text("로그인")
                                    .foregroundColor(Color(hex: 0xA07400))
                            }
                        
                        //상단 회원가입 버튼
                        NavigationLink(destination: SignupView().navigationBarBackButtonHidden(true), label: {
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 50)
                                .foregroundColor(Color(hex: 0xB19471))
                                .overlay {
                                    Text("회원가입")
                                        .foregroundColor(.white)
                                }
                        })// 회원가입 버튼 }
                    }// hstack }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                    // 아이디 입력 텍스트 필드
                    TextField("아이디", text: $memberID)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .padding(20)
                        .background(Color(hex: 0xd1c9b3))
                        .cornerRadius(20)
                    // 비밀번호 입력 텍스트 필드
                    SecureField("비밀번호", text: $memberPassword)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .padding(20)
                        .background(Color(hex: 0xd1c9b3))
                        .cornerRadius(20)
                    Spacer()
                    Spacer()
                    // 완료버튼
                    
                    Button(action: {
                        print("로그인 버튼 클릭")
                        print(memberID + "ddddd" + memberPassword)
                        self.restApi.POST_Login(userId: memberID, pwd: memberPassword, closure: { [self] datas in
                            tokenMember = datas
                            
                            if (tokenMember.grantType == "Bearer") {
                                print("로그인 성공")
                                ContentView()
                            } else {
                                print("로그인 실패")
                            }
                        })
                    }, label: {
                        Image("완료")
                            .resizable()
                        .frame(width: 200, height: 80)}).alert("로그인이 완료되었습니다.", isPresented: $shouldShowAlert){
                            Button("확인", role:.cancel) {
                                signInSuccess.toggle()
                                if signInSuccess {
                                    
                                }
                            }
                        }
                    
                    Spacer()
                }
                
                //                .sheet(isPresented: $showSignup) {
                //                    ContentView()
                //                }
                .padding(.horizontal, 15)
            }//zstack
        }
    }

}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ex_login_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
