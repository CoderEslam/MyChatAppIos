//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI

struct MessageBubble: View {
    var message : Message
    @State private var showTime = false
    var body: some View {
        VStack (alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300,alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                withAnimation(){
                    showTime.toggle()
                }
            }
            if (showTime) {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing ,25 )
            }
        }
        .frame(maxWidth: .infinity,alignment: message.received ? .leading : .trailing)
        .padding(.horizontal,10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1235", text: "I'm been coding SwiftUI appliction form scratch and it's so mush fun", received: true, timestamp: Date()))
    }
}
