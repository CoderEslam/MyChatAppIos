//
//  MessgeField.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI

struct MessgeField: View {
    // to sand message from app
    @EnvironmentObject var messageManager : MessageManger
    @State private var message = ""
    
    var body: some View {
        HStack{
            CustomTextField(placeholder: Text("Enter your message here..."), text: $message)
            
            Button{
                messageManager.sendMesage(text: message)
                message = ""
            }label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessgeField_Previews: PreviewProvider {
    static var previews: some View {
        MessgeField()
        // make it as environmentObject
            .environmentObject(MessageManger())
    }
}

struct CustomTextField : View {
    
    var placeholder : Text
    @Binding var text :String
    var editingChange : (Bool) -> () = {_ in}
    var commit : () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading){
            if (text.isEmpty){
                placeholder.opacity(0.5)
            }
            
            TextField("", text: $text,onEditingChanged: editingChange,onCommit: commit)

        }
    }
    
}
