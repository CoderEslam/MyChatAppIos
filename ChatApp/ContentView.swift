//
//  ContentView.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI

//MARK - Link youtube
//https://www.youtube.com/watch?v=Zz9XQy8PRpQ&t=48s&ab_channel=DesignCode
struct ContentView: View {
    
    @StateObject var messageManger = MessageManger()
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messageManger.messages,id: \.id){ message in
                            MessageBubble(message: message)
                        }
                    }.padding(.top,10)
                        .background(.white)
                    .cornerRadius(30, corner: [.topLeft,.topRight])
                    .onChange(of: messageManger.lastMessageId){ id in
                        withAnimation{
                            // to scroll to last message in list
                            proxy.scrollTo(id,anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("Peach"))
            
            MessgeField()
                .environmentObject(messageManger)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
