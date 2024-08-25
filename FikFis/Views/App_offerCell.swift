//
//  App_offerCell.swift
//  FikFis
//
//  Created by apple on 24/08/24.
//

import SwiftUI

struct App_offerCell: View {
 
    let appOffer : AppOfferM
    let termsList: [TermsOfUse] = [
        TermsOfUse(id: 0, title: "hghjgm,hg")
    ]
    
    @State var validity: String = "Validity 25July 2024"
    
    var body: some View {
        VStack{
            header
            
            termsOfUse
            
            validty
            
        }
        
//        .background(Color.gray)
        .frame(width: UIScreen.screenWidth - 20,height: 196)
        .border(Color.gray)
        .cornerRadius(5)
    }
    
    var header :some View{
        var button_height : CGFloat = 40
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
            Spacer()
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
    App_offerCell(appOffer:
        AppOfferM(id: 0, termsOfUse: [TermsOfUse(id: 0, title: "Lorem Ipsum is simply dummy text of the printing."),TermsOfUse(id: 1, title: "Lorem Ipsum is simply dummy text of the printing.")], validity: "Validity 25July 2024   ", offerValue: "SAVE100")
       )
}
