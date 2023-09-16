//
//  MessageManger.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManger : ObservableObject {
    
    @Published private(set) var messages : [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init() {
        // to run function with app run
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{querySnapshot ,error  in
            guard let docments = querySnapshot?.documents else {
                print("Error fetch documents: \(String(describing: error))")
                return
            }
            
            self.messages = docments.compactMap{ docment -> Message?  in
                do {
                    // to put date as Message Object
                    return try docment.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            // to sort the same array by timestamp in itself
            self.messages.sort{ $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }
    }
    
    func sendMesage(text : String){
        
        do{
            let ref = db.collection("messages").document()
            // ref is a DocumentReference
            let id = ref.documentID
            // id contains the random ID
            let newMessage = Message(id: "\(id)", text: text, received: false, timestamp: Date())
            try ref.setData(from: newMessage)
            
        }catch{
            print("Error adding to Firestore : \(error)")
        }
        
    }
    
}
