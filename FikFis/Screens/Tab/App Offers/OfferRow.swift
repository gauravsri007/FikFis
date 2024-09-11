//
//  OfferRow.swift
//  FikFis
//
//  Created by apple on 07/09/24.
//

import SwiftUI

struct OfferRow: View {
    
    let appOffer : AppOfferM
    let termsList: [TermsOfUse] = [
        TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),
        TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")
    ]
    
    @State var validity: String = "Validity 25July 2024"
    
    var body: some View {
        VStack(alignment: .leading){
            header
            
            termsOfUse
            
            validty
                .padding([.bottom],10)
            
        }
        .frame(width: UIScreen.screenWidth - 20,height: 196)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1))
    }
    
    var header :some View{
        let button_height : CGFloat = 40
        return HStack{
            Text("SAVE 100")
                .font(.custom_font(.semiBold, size: 20))
            Spacer()
            Button{
                
            }
            label:{
            Image("copy")
                    .resizable()
                    .padding(10)
                    .cornerRadius(5)
                    .aspectRatio(contentMode: .fit)
                    .background {
                        Circle()
                            .foregroundStyle(Color.themeColor)
                    }
                    .frame(width: button_height,height: button_height)
                    

            }
            .padding([.top,.trailing],10)
            
        }
        .padding(.leading)
    }
    
    var validty :some View{
        return VStack(){
            Text(validity)
                .foregroundStyle(Color.green)
                .font(.custom_font(.medium,size: 14))
        }
        .padding(.leading)
    }
    
    var termsOfUse :some View{
        return VStack(alignment: .leading){
            Text("Terms of use")
                .font(.custom_font(.medium, size: 15))
            ScrollView{
                ForEach(termsList){ terms in
                    HStack{
                        Text(".")
                        Text(terms.title)
                    }
                }
            }
            
        }
        .padding(.leading)
    }
    
    
}

#Preview {
    OfferRow(appOffer:
        AppOfferM(termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100")
       )
}
