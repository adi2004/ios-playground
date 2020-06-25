//
//  TextFieldCellTableViewCell.swift
//  TextFiledCells
//
//  Created by Adrian Florescu on 12.09.17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

protocol PhoneNumberDelegate {
    func phoneNumberDidChange(_ phoneNumber: PhoneNumber)
}

class TextFieldCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    var delegate: PhoneNumberDelegate?

    var phoneNumber: PhoneNumber? {
        didSet {
            typeLabel.text = phoneNumber?.type
            textField.text = phoneNumber?.number
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TextFieldCell: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        phoneNumber?.number = textField.text ?? ""
        if let phoneNumber = phoneNumber {
            delegate?.phoneNumberDidChange(phoneNumber)
        }
        return true
    }
}
