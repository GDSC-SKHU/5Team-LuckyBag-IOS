//
//  select_luckybag_View.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/10.
//

import SwiftUI

struct select_luckybag_View: View {
    @State var letter: String = ""
    @State var lucky_bag = 0
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("select_luckybag")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea() // 위 아래 safearea인 여백을 무시하고 채워줌
                VStack {
                    HStack {
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                            Text("<이전으로")
                                .foregroundColor(.brown)
                                .font(.system(size: 20))
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        })
                        Spacer()
                    }
                    Spacer().frame(width: 1)
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .frame(width: .infinity, height: UIScreen.main.bounds.height / 1.7)
                            .padding(15)
                            
                        VStack{
                            Spacer()
                            Text("복주머니 선택창")
                                .foregroundColor(Color(hex: 0xA07400))
                                .font(.system(size: 26, weight: .bold))
                            Spacer()
                            HStack {
                                Button(action: {
                                    lucky_bag = 1
                                }) {
                                    Image("redbag")
                                        .resizable()
                                        .frame(width: 105, height: 150)
                                }
                                .overlay(
                                    lucky_bag == 1 ? Color.brown.opacity(0.2) : nil
                                )
                                Button(action: {
                                    lucky_bag = 2
                                })
                                {
                                    Image("bluebag")
                                        .resizable()
                                        .frame(width: 105, height: 150)
                                }
                                .overlay(
                                    lucky_bag == 2 ? Color.brown.opacity(0.2) : nil
                                )
                                Button(action: {
                                    lucky_bag = 3
                                })
                                {
                                    Image("greenbag")
                                        .resizable()
                                        .frame(width: 105, height: 150)
                                }
                                .overlay(
                                    lucky_bag == 3 ? Color.brown.opacity(0.2) : nil
                                )
                                
                            }
                            Spacer()
                            
                            NavigationLink(destination: message_View().navigationBarBackButtonHidden(true), label: {
                                Image("decision")
                                    .resizable()
                                    .frame(width: 200, height: 80)
                                })
                            Spacer()
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                }
                
            }
            
        }
        
    }
}

struct select_luckybag_View_Previews: PreviewProvider {
    static var previews: some View {
        select_luckybag_View()
    }
}
