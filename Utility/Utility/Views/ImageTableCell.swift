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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateCell(with employee: Employee) {
        self.employId.text = String(employee.id)
        self.employeeName.text = employee.name
    }
    
}
