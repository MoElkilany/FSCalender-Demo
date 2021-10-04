//
//  MainViewCell.swift
//  FSCalender-Demo
//
//  Created by Mohamed Elkilany on 30/09/2021.
//

import UIKit

class MainViewCell: UITableViewCell {
    static let cellID = "MainViewCell"

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dateLab: UILabel!
    @IBOutlet weak var dayLab: UILabel!
    @IBOutlet weak var meetingAddressLab: UILabel!
    @IBOutlet weak var timeLab: UILabel!
    @IBOutlet weak var periodLab: UILabel!
    @IBOutlet weak var numberLab: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 22
        selectionStyle = .none
    }
    
    static func nib()->UINib{
        return UINib(nibName: cellID, bundle: nil)
    }
    
}
