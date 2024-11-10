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
    
    
}
