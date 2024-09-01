//
//  BlogDetailsV.swift
//  FikFis
//
//  Created by apple on 01/09/24.


import SwiftUI

struct BlogDetailsV: View {
    let blogDetails = BlogDetails.value()
    var hideBtn: Bool = false

    var body: some View {
            
                NavigationHeader()
        
                VStack(alignment: .leading){
                    Image(blogDetails.imageURL)
                        .resizable()
                        .padding([.vertical],10)

                    Text(blogDetails.date)
                        .font(.custom_font(.regular,size: 15))
                        .foregroundStyle(Color.init(hexa: "4C4C4C"))
                        .padding([.bottom])

                    Text(blogDetails.header)
                        .font(.custom_font(.medium,size: 18))
                        .foregroundStyle(Color.init(hexa: "000000"))
                    Text(blogDetails.description)
                        .font(.custom_font(.regular,size: 16))
                        .foregroundStyle(Color.init(hexa: "000000"))
                        .padding([.bottom])
                    
                    
                    
                    HStack{
                        Text("by")
                            .font(.custom_font(.regular,size: 16))
                            .foregroundStyle(Color.init(hexa: "4C4C4C"))
                        Text("FikFis")
                            .font(.custom_font(.regular,size: 16))
                        
                        Spacer()
                        
                        Text("Read More")
                            .font(.custom_font(.regular,size: 16))
                            .foregroundStyle(Color.init(hexa: "4C4C4C"))
                        
               
                            
                            
                    }
                    .padding([.bottom],10)
//                    .overlay(alignment: .bottomTrailing, content: {
//                        if !hideBtn {
//                            NavigationLink(destination: BlogRow(blog: blog),
//                                label: {
//                                Image(systemName: "arrow.forward")
//                            })
//                            .foregroundStyle(.white)
//                            .padding(10)
//                            .background {
//                                Color.themeColor
//                            }
//                            .clipShape(Circle())
//                            .padding(.bottom, 9)
//                        }
//                    })
                    
                }
                .padding([.horizontal],10)
         
            
        }
    
}

#Preview {
    BlogDetailsV()
}
