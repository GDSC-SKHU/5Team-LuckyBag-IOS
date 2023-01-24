//
//  mymessage_View.swift
//  gdsc_miniproject
//
//  Created by 박신영 on 2023/01/09.
//

import SwiftUI

struct mymessage_View: View {
    //편지 내용 저장
    @State var letter: String = ""
    
    
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
                    Spacer()
                }
                VStack {
                    Spacer().frame(width: 1)
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .frame(width: .infinity, height: UIScreen.main.bounds.height / 1.8)
                            .padding(15)
                        VStack{
                            Text("내가 쓴 메시지")
                                .foregroundColor(Color(hex: 0xA07400))
                                .font(.system(size: 26, weight: .bold))
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 6, dash: [12]))
                                .foregroundColor(Color(hex: 0xA07400))
                                .cornerRadius(10)
                                .frame(width: .infinity, height: UIScreen.main.bounds.height / 2.5)
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                                .overlay {
                                    TextField("덕담을 나눠보아요!", text: $letter, axis: .vertical)
                                        .keyboardType(.default)
                                        .autocapitalization(.none)
                                        .frame(width: .infinity, height: UIScreen.main.bounds.height / 2.5, alignment: .center)
                                        .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
                                }
                            
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), label: {
                            Image("수정")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            print("a")
                        }
                        ) {
                            Image("삭제")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                
            }
            
        }
        
    }
    
}

struct mymessage_View_Previews: PreviewProvider {
    static var previews: some View {
        mymessage_View()
    }
}
