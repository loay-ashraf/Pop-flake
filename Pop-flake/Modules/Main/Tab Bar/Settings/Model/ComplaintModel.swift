//
//  Model.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

struct ComplaintModel {
    
    let name: String?
    let phoneNumber: String?
    let email: String?
    let complaint: String?
    
    init(from complaintForm: [String:Any?]) {
        name = complaintForm["NameRow"] as? String
        phoneNumber = complaintForm["PhoneRow"] as? String
        email = complaintForm["EmailRow"] as? String
        complaint = complaintForm["ComplaintRow"] as? String
    }
    
}
