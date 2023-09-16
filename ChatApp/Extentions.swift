//
//  Extentions.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI

extension View {
    
    func cornerRadius(_ radius : CGFloat , corner:UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius,corners: corner))
    }
    
}

struct RoundedCorner : Shape {
    var radius : CGFloat = .infinity
    var corners : UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
