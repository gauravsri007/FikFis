//
//  OrderDetail.swift
//  FikFis
//
//  Created by sveltetech on 25/08/24.
//

import SwiftUI

struct OrderDetail: View {
    
    var item: Order
    
    let statusData = [
        ("Order Confirmed", "Tuesday 6th July - 12:30 pm", true),
        ("Shipped", "Wednesday 7th July - 12:30 pm", true),
        ("Out For delivery", "Thursday 8th July - 12:30 pm", false),
        ("Delivered", "Friday 9th July - 12:30 pm", false)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            OrderView(item: item, hideBtn: true).frame(height: 95)
            
            orderDetails
            
            deliveredDetails
            
            shipDetails
            
            invoiceDetails
            
            orderProgressDetails
            
            productSupport
            
        }
        .padding(5)
    }
    
    var orderDetails: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("ORDER PLACED").font(.custom_font(.semiBold, size: 16))
                Text(item.date)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("TRACK ORDER").font(.custom_font(.semiBold, size: 16))
                Text(item.trackId)
            }
        }
    }
    
    var deliveredDetails: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Delivered 23 July").font(.custom_font(.semiBold, size: 16))
                Text("Delivered to resident")
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("TOTAL").font(.custom_font(.semiBold, size: 16))
                Text("£10,000 include taxes")
            }
        }
    }
    
    var shipDetails: some View {
        VStack(alignment: .leading) {
            Text("SHIP TO : ").font(.custom_font(.semiBold, size: 16)) + Text("Mr. John Smith")
            Text("Street Address: 123 Fake Street, London, SW1A 1AA,")
            Text("Phone Number: +44 845625361")
        }
    }
    
    var invoiceDetails: some View {
        HStack {
            NavigationLink(destination: OrderDetail(item: item), label: {
                Text("Invoice").foregroundStyle(Color.themeColor)
            })
            
            NavigationLink(destination: OrderDetail(item: item), label: {
                Text("  |  " + "View your item").foregroundStyle(Color.themeColor)
            })
            
            NavigationLink(destination: OrderDetail(item: item), label: {
                Text("  |  " + "View order details").foregroundStyle(Color.themeColor)
            })
        }
    }
    
    var orderProgressDetails: some View {
        VStack(alignment: .leading) {
            ForEach(0..<statusData.count, id: \.self) { index in
                HStack(alignment: .top) {
                    // Timeline dots and lines
                    VStack {
                        Circle()
                            .fill(statusData[index].2 ? Color.green : Color.gray)
                            .frame(width: 12, height: 12)
                        
                        if index != statusData.count - 1 {
                            Rectangle()
                                .fill(statusData[index].2 ? Color.green : Color.gray)
                                .frame(width: 2, height: 50)
                        }
                    }
                    
                    Group {
                        // Status text
                        Text(statusData[index].0)
                            .font(.custom_font(.regular, size: 14))
                        
                        + Text(" " + statusData[index].1)
                            .font(.custom_font(.regular, size: 14))
                            .foregroundColor(.gray)
                    }.padding(.top, -4)
                }
            }
        }
        //.padding()
    }
    
    var productSupport: some View {
        HStack {
            NavigationLink(destination: OrderDetail(item: item), label: {
                Text("Write a product review").foregroundStyle(Color.themeColor)
            })
            
            NavigationLink(destination: OrderDetail(item: item), label: {
                Text("  |  " + "Get product support").foregroundStyle(Color.themeColor)
            })
        }
    }
    
}

#Preview {
    OrderDetail(item: Order(id: 2, title: "Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes Mens shoes", imageUrl: "product1", desc: "Return window open on 25 July 2024"))
}
