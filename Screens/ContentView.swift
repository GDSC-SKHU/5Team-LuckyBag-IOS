//
//  ContentView.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/04.
//


import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("토끼화면")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        NavigationLink(destination: mymessage_View().navigationBarBackButtonHidden(true), label: {
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
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
