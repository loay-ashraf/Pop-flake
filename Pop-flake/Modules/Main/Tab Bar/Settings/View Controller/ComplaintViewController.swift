//
//  ComplaintViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import UIKit
import Eureka

class ComplaintViewController: FormViewController {
    
    var submitHandler: ([String:Any?]) -> Void
    
    init(submitHandler: @escaping ([String:Any?]) -> Void) {
        self.submitHandler = submitHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "File A Complaint"
        form +++ Section("Personal Information")
        <<< TextRow(){ row in
            row.tag = "NameRow"
            row.title = "Name"
            row.placeholder = "Enter your name"
        }
        <<< PhoneRow(){ row in
            row.tag = "PhoneRow"
            row.title = "Phone Number"
            row.placeholder = "Enter your phone number"
        }
        <<< TextRow(){ row in
            row.tag = "EmailRow"
            row.title = "Email"
            row.placeholder = "Enter your email"
        }
        +++ Section("Complaint")
        <<< TextAreaRow(){ row in
            row.tag = "ComplaintRow"
            row.title = "What's your complaint?"
            row.placeholder = "Type your complaint here..."
        }
        <<< ButtonRow(){ row in
            row.tag = "SubmitRow"
            row.title = "Submit"
            row.onCellSelection { (cell, row) in
                let valuesDictionary = self.form.values()
                self.submitHandler(valuesDictionary)
            }
        }
    }
}
    
