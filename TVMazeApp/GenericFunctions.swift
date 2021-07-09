//
//  GenericFunctions.swift
//  TVMazeApp
//
//  Created by Dev on 09/07/21.
//

import UIKit

class GenericFunctions: NSObject {
    
    //MARK:- Custom Alert view controller
    
    static func showAlert(targetVC: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okalert = UIAlertAction (title: "OK", style:
                                        UIAlertAction.Style.default, handler: { UIAlertActionStyle in
                                            alert.dismiss(animated: true, completion: nil)
                                        })
        alert.addAction(okalert)
        targetVC.present(alert, animated: true, completion: nil)
        
    }
}
    
