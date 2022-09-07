//
//  ImageTableCell.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/1/22.
//

import UIKit

class ImageTableCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var employId: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    var employee: Employee?
    let loader = ImageLoader()
    var onReuse: () -> Void = {}
    
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
        super.prepareForReuse()
        onReuse()
        self.profileImage.image = nil
    }
    
    func loadProfileImage() {
        guard let str = self.employee?.profileImage else {
            return
        }
        guard let url = URL(string: str) else {
            return
        }
        
        let token = loader.loadImage(from: url) {[weak self] result in
            guard let self = self else { return }
            do {
              let image = try result.get()
              DispatchQueue.main.async {
                  self.profileImage.image = image
              }
            } catch {
              // handle the error
            }
        }
        
        onReuse = { [weak self] in
            guard let self = self else { return }
            if let token = token {
                self.loader.cancelLoad(token)
            }
        }

    }
}
