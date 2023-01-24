//
//  MainView_luckybag.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/10.
//

import SwiftUI

struct MainView_luckybag: View {
    @State private var duckdam = false
    @State private var mymessage = false
    @State private var logout = false
    @Binding var lucky_bag_count: Int
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("mainview")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        NavigationLink(destination: message_View().navigationBarBackButtonHidden(true), label: {
                            Text("내 메세지")
                                .foregroundColor(.brown)
                                .font(.system(size: 15))
                                .padding(15)
                        })
                        
                        Spacer()
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), label: {
                            Text("로그아웃")
                                .foregroundColor(.brown)
                                .font(.system(size: 15))
                                .padding(15)
                        })
                    }
                    
                    Spacer()
                    Text("총 메시지 개수 : \(lucky_bag_count)개")
                        .foregroundColor(Color(hex: 0xA07400))
                    NavigationLink(destination: select_luckybag_View().navigationBarBackButtonHidden(true), label: {
                        Image("DuckButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 30, trailing: 50))
                    })
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
        
}

struct MainView_luckybag_Previews: PreviewProvider {
    static var previews: some View {
        MainView_luckybag(lucky_bag_count: .constant(0))
    }
}
