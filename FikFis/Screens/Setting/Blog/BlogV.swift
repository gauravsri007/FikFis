//
//  BlogV.swift
//  FikFis
//
//  Created by apple on 31/08/24.
//

import SwiftUI

struct BlogV: View {
    var body: some View {
        NavigationHeader()
        VStack{
            BlogRow()
//            headerView
//            
//            contentView
//                .padding()
            
        }
    }
    
//    var blogList : some View{
//        
//    }
}

#Preview {
    BlogV()
}


struct BlogRow: View {
    let blog : Blog

    var body: some View {
            ZStack{
                Image(blog.imageURL)
                
                Text(blog.date)
                
                Text(blog.header)
                Text(blog.header)

                
                
            }
            .padding()
            .border(Color.gray, width: 1)

            
        }
    
}
