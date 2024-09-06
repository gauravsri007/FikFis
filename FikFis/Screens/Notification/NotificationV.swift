//
//  NotificationV.swift
//  FikFis
//
//  Created by apple on 06/09/24.
//

import SwiftUI

struct NotificationV: View {
    var arrNotification = NotificationM.all()

    
    var body: some View {
        NavigationHeader()

        VStack(alignment: .leading){
            
            HeaderLabel(header: "Notification")
            
            ScrollView{
                VStack(alignment: .leading){
                    ListView
                }
            }
        }
    }
    

    var ListView:some View{
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(arrNotification) { notification in
                NotificationRow(notification: notification)
            }
        }
    }
    
}

#Preview {
    NotificationV()
}
