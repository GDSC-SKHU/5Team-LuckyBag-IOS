//
//  message_View.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/10.
//

import SwiftUI

struct message_View: View {
    //편지 내용 저장
    @State var letter: String = ""
    @State var lucky_bag_count = 0 //복주머니 개수 표현할 변수
    let maxlength = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("select_luckybag")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea() // 위 아래 safearea인 여백을 무시하고 채워줌
                VStack {
                    HStack {
                        NavigationLink(destination: select_luckybag_View().navigationBarBackButtonHidden(true), label: {
                            Text("< 이전으로")
                                .foregroundColor(.brown)
                                .font(.system(size: 20))
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                        })
                        Spacer()
                    }
                    Spacer()
                }
                VStack {
                    Spacer().frame(width: 1)
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 2)
                            .padding(15)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                        VStack{
                         Text("메시지 작성")
                          .foregroundColor(Color(hex: 0xA07400))
                          .font(.system(size: 26, weight: .bold))
                         Rectangle()
                          .stroke(style: StrokeStyle(lineWidth: 6, dash: [12]))
                          .foregroundColor(Color(hex: 0xA07400))
                          .cornerRadius(10)
                          .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 2.5)
                          .fixedSize(horizontal: true, vertical: false)
                          .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                          .overlay {
                              TextField("덕담을 나눠보아요", text: $letter, axis: .vertical)
                                 .keyboardType(.default)
                                 .autocapitalization(.none)
                                 .frame(width: UIScreen.main.bounds.width / 1.4, height: UIScreen.main.bounds.height / 2.5, alignment: .center)
                                 .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
                                 .multilineTextAlignment(.leading)
//                                 .fixedSize(horizontal: false, vertical: true)
//                                 .lineLimit(nil)
                            
                          }
                        }
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        NavigationLink(destination: MainView_luckybag(lucky_bag_count: self.$lucky_bag_count).navigationBarBackButtonHidden(true), label: {
                            
//                            self.lucky_bag_count += 1
                            Image("write_good")
                                .resizable()
                                .frame(width: 200, height: 80)
                        })
                    }
                }
                
            }
            
        }
        
    }
}

struct message_View_Previews: PreviewProvider {
    static var previews: some View {
        message_View()
    }
}
