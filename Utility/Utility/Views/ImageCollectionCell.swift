//
//  ImageCollectionCell.swift
//  Utility
//
//  Created by Zhang, Wanming on 9/6/22.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var employId: UILabel!
    @IBOutlet weak var employeeName: UILabel!
    var employee: Employee?
    let imageLoader = ImageLoader()
    var onReuse: () -> Void = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        profileImage.image = nil
        onReuse()
    }
    func updateWith(_ employee: Employee) {
        self.employee = employee
        self.employId.text = String(employee.id)
        self.employeeName.text = employee.name
        self.loadProfileImage(with: employee.profileImage)
    }
    
    func loadProfileImage(with imageStr: String) {
        guard let url = URL(string: imageStr) else {
            return
        }
        let token = imageLoader.loadImage(from: url) {[weak self] result in
            guard let self = self else { return }
            do {
                let image = try result.get()
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
            } catch {
                // handle error
            }
        }
        
        if let token = token {
            self.onReuse = { [weak self] in
                self?.imageLoader.cancelLoad(token)
            }
        }
        
    }
}
