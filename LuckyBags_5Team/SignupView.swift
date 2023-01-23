//
//  ex_login.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/09.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var shouldShowAlert : Bool = false
    
    @State var nicknameInput: String = ""
    @State var idInput: String = ""
    @State var passwordInput: String = ""
    
    
    
    
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
                        //상단 로그인버튼
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), label: {
                            RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 150, height: 50)
                                        .foregroundColor(Color(hex: 0xB19471))
                                        .overlay {
                                            Text("로그인")
                                                .foregroundColor(.white)
                                        }
                        })// 상단 로그인버튼 닫기
                        
                        //상단 회원가입버튼
                        RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 50)
                                    .foregroundColor(.white)
                                    .overlay {
                                        Text("회원가입")
                                            .foregroundColor(Color(hex: 0xA07400))
                                    }
                    }
                    //닉네임 입력 텍스트 필드
                    TextField("닉네임", text: $nicknameInput)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .padding(20)
                        .background(Color(hex: 0xd1c9b3))
                        .cornerRadius(20)
                    
                    // 아이디 입력 텍스트 필드
                    TextField("아이디", text: $idInput)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .padding(20)
                        .background(Color(hex: 0xd1c9b3))
                        .cornerRadius(20)
                    
                    // 비밀번호 입력 텍스트 필드
                    TextField("비밀번호", text: $passwordInput)
                        .keyboardType(.default)
                        .autocapitalization(.none)
                        .padding(20)
                        .background(Color(hex: 0xd1c9b3))
                        .cornerRadius(20)
                    
                    Spacer()
                        
                    
                        Button {
                            print("회원가입 버튼 클릭")
                            self.shouldShowAlert = true
                        } label: {
                            Image("완료")
                                .resizable()
                                .frame(width: 200, height: 80)
                        }// 회원가입 버튼
                        .alert("회원가입이 완료되었습니다.", isPresented: $shouldShowAlert){
                            Button("확인", role: .cancel) {
                                self.dismiss()
                            }
                        }
                    
                    
                    
                    
                    Spacer()
                }
                
//                .sheet(isPresented: $showSignup) {
//                    ContentView()
//                }
                .padding(.horizontal, 15)
            }
        }
    }
}

struct ex_register_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
