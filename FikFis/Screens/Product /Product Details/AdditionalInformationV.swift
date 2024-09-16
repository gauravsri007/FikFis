//
//  AdditionalInformationV.swift
//  FikFis
//
//  Created by apple on 10/09/24.
//

import SwiftUI

struct AdditionalInformationV: View {
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            
            Spacer().frame(height: 10)
            
            detailsHeader(header: "Technical Details")
            technicalDetailsSection
                .padding([.vertical],60)
            
            
            detailsHeader(header: "Additional Feature")
            additionalFeatureSection
                .padding([.vertical],60)

            detailsHeader(header: "Key Information")
            keyInformationSection
                .padding([.vertical],60)

        }
    }
    
    func detailsHeader(header : String) -> some View {
        return HStack {
            Text(header)
                .font(.custom_font(.medium, size: 25))
            Spacer()
        }
        .padding([.top, .horizontal],10)
    }

        
    var technicalDetailsSection: some View {
        VStack{
            HStack {
                Text("OS")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("RAM")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("Connectivity technologies")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("Special Features")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
        }
        .border(.gray, width: 1)
        .frame(width: appWidth - 20,height: 30)
        .padding()
    }
    
    var additionalFeatureSection: some View {
        VStack{
            HStack {
                Text("OS")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("RAM")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("Connectivity technologies")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("Special Features")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
        }
        .border(.gray, width: 1)
        .frame(width: appWidth - 20,height: 30)
        .padding()

    }
    
    var keyInformationSection: some View {
        VStack{
            HStack {
                Text("OS")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("RAM")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("Connectivity technologies")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
            Divider()
            
            HStack {
                Text("Special Features")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
                Divider()
                Text("‎Android 13.0")
                    .font(.custom_font(.regular, size: 12))
                    .frame(width: appWidth / 2 - 40,height: 30)
            }
            .frame(width: appWidth - 20,height: 30)
        }
        .border(.gray, width: 1)
        .frame(width: appWidth - 20,height: 30)
        .padding()

    }

}
    

#Preview {
    AdditionalInformationV()
}
