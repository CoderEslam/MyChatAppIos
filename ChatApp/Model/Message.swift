//
//  Message.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI

struct Message : Identifiable , Codable {
    var id : String
    var text: String
    var received : Bool
    var timestamp : Date
}
