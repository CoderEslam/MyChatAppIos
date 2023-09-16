//
//  TitleRow.swift
//  ChatApp
//
//  Created by Eslam Ghazy on 16/9/23.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg"
    var name = "Eslam Ghazy"
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: URL(string: imageUrl)){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
            
            
        }.padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow().background(Color("Peach"))
    }
}
