//
//  ImageTableCell.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/1/22.
//

import UIKit

class ImageTableCell: UITableViewCell {

    @IBOutlet weak var profileImage: CachedImageView!
    @IBOutlet weak var employId: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    var employee: Employee?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImage.image = nil
    }

    func updateCell(with employee: Employee) {
        self.employee = employee
        self.employId.text = String(employee.id)
        self.employeeName.text = employee.name
        self.loadProfileImage()
    }
    
    override func prepareForReuse() {
        self.profileImage.image = nil
    }
    
    func loadProfileImage() {
        guard let str = self.employee?.profileImage else {
            return
        }
        guard let url = URL(string: str) else {
            return
        }
        
        profileImage.loadImage(from: url) { [weak self] (image, error) in
            guard let self = self else { return }
            guard let image = image, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.profileImage.image = image
            }
        }
        
    }
}
