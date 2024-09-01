//
//  BlogV.swift
//  FikFis
//
//  Created by apple on 31/08/24.
//

import SwiftUI

struct BlogV: View {
    
    let arrBlog = Blog.all()

    var body: some View {
        
        NavigationHeader()

        NavigationView {
            ZStack{
                Color.init(hex: "f9f9f9")
                    .edgesIgnoringSafeArea(.top)
                VStack(alignment: .leading) {
                    
                    blogList
                }
                .padding()
            }
        }
    }
    
    var blogList : some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
                ForEach(self.arrBlog, id: \.id) { _blog in
                    BlogRow(blog: _blog)
                }
                .padding([.horizontal],0)
            }
        }
    }

}

#Preview {
    BlogV()
}


struct BlogRow: View {
    let blog : Blog
    var hideBtn: Bool = false

    var body: some View {
        NavigationView {
            
            ZStack(){

                VStack(alignment: .leading){
                    Image(blog.imageURL)
                        .resizable()
                        .padding([.vertical],10)

                    Text(blog.date)
                        .font(.custom_font(.regular,size: 15))
                        .foregroundStyle(Color.init(hexa: "4C4C4C"))
                        .padding([.bottom])

                    Text(blog.header)
                        .font(.custom_font(.medium,size: 18))
                        .foregroundStyle(Color.init(hexa: "000000"))
                    Text(blog.description)
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
                    .overlay(alignment: .bottomTrailing, content: {
                        if !hideBtn {
                            NavigationLink(destination: BlogDetailsV(),
                                label: {
                                Image(systemName: "arrow.forward")
                            })
                            .foregroundStyle(.white)
                            .padding(10)
                            .background {
                                Color.themeColor
                            }
                            .clipShape(Circle())
                            .padding(.bottom, 9)
                        }
                    })
                    
                }
                .padding([.horizontal],10)
            }
            .padding([.horizontal],0)
            .cornerRadius(5)
            .border(Color.gray, width: 1)
            .shadow(color: Color.init(hex: "dddddd"), radius: 2, x: 0.8, y: 0.8)
            
        }
    }
    
}

#Preview {
    BlogV()
}
