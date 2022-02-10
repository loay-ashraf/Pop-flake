//
//  SettingsViewController.swift
//  Pop-flake
//
//  Created by Loay Ashraf on 10/02/2022.
//

import Foundation

import UIKit
import InAppSettingsKit

class SettingsViewController: IASKAppSettingsViewController {
    
    var complaintModel: ComplaintModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    // MARK: - View Actions
    
    func showComplaintForm(action: UIAlertAction) {
    }
    
}

extension SettingsViewController: IASKSettingsDelegate {
    
    // MARK: - IASKSettings Delegate
    
    func settingsViewControllerDidEnd(_ settingsViewController: IASKAppSettingsViewController) { }
    
    func settingsViewController(_ settingsViewController: IASKAppSettingsViewController, buttonTappedFor specifier: IASKSpecifier) {
        if specifier.key == "complaintButton" {
            let complaintViewController = ComplaintViewController { form in
                self.complaintModel = ComplaintModel(from: form)
                NavigationHelper.pop()
            }
            NavigationHelper.push(viewController: complaintViewController)
        }
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
}
