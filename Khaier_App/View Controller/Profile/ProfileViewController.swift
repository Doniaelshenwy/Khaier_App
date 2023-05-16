//
//  ProfileViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    let apiRequest: ProfileAPIProtocol = ProfileAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profileRequest()
    }
    
    private func profileRequest() {
        apiRequest.profileRequest { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let profileData = data?.user {
                    self.nameLabel.text = profileData.name
                    self.phoneLabel.text = profileData.phoneNumber
                    self.profileImage.setImageKF(urlImage: profileData.thumbnail)
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func moveToEditPasswordVC() {
        let vc = EditPasswordViewController()
        push(vc: vc)
    }
    
    private func moveToCalculateZakatVC() {
        let vc = CalculateZakatViewController()
        push(vc: vc)
    }

    @IBAction func notificationButton(_ sender: Any) {
    }
    
    @IBAction func editProfileButton(_ sender: Any) {
        let vc = EditProfileViewController()
        push(vc: vc)
    }
    
    @IBAction func rememberView(_ sender: Any) {
        let vc = ReminderViewController()
        push(vc: vc)
    }
    
    @IBAction func calculateZakatView(_ sender: Any) {
        moveToCalculateZakatVC()
    }
    
    @IBAction func editPasswordView(_ sender: Any) {
        moveToEditPasswordVC()
    }
    
    @IBAction func aboutApplicationView(_ sender: Any) {
    }
    
    @IBAction func deleteAccountView(_ sender: Any) {
        let vc = DeleteAccountViewController()
        customPresent(vc, animated: false)
    }
    
    @IBAction func logoutView(_ sender: Any) {
        let vc = ExitViewController(delegate: self)
        customPresent(vc, animated: false)
    }
}

extension ProfileViewController: LogoutProtocol {
    func movetoLoginVCFromExitVC() {
        moveToLoginVC()
    }
}
