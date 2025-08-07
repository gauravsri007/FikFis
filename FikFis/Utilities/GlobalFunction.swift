//
//  GlobalFunction.swift
//  FikFis
//
//  Created by apple on 08/11/24.
//

import Foundation
import UIKit
import BRYXBanner

class GlobalFunction{
    static let shared = GlobalFunction()
    func showAlert_banner(msg:String,bgColor:UIColor,type:Alert_message){
        let strMessage = msg
        let banner: Banner
        if type == .success {
            banner = Banner(title: "Success", subtitle: strMessage, image: UIImage(named: "approved"), backgroundColor: bgColor)
        }
        else{
            banner = Banner(title: "Alert", subtitle: strMessage, image: UIImage(named: "rejected"), backgroundColor: bgColor)
        }
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
    
    func storeLocalData(_ response: LoginResponse) {
        print("response: \(response)")
        Udefault.set(response.access_token, forKey: KEY_ACCESS_TOKEN)
        Udefault.set(response.refresh_token, forKey: KEY_REFRESH_TOKEN)
        Udefault.set(response.username, forKey: KEY_USER_NAME)
        Udefault.set(response.email, forKey: KEY_EMAIL)
        Udefault.set(response.phone, forKey: KEY_PHONE_NUMBER)
        Udefault.set(true, forKey: KEY_IS_LOGGEDIN)
        Udefault.synchronize()
    }
    
    
}
