//
//  ViewModel.swift
//  TextFiledCells
//
//  Created by Adrian Florescu on 12.09.17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

class ViewModel {

    var sections: [Section] = []

    init(_ tableView: UITableView, _ headerView: UIView?) {
        guard let meCell = tableView.dequeueReusableCell(withIdentifier: "BasicCell") else { return }
        meCell.textLabel?.text = "Ich"
        let personSection = Section.init(headerString: "Person", cells: [meCell], headerView: nil)
        sections.append(personSection)

        //TODO: read phonenumbers
        let pn = [PhoneNumber(type: "Mobile", number: "0021.3232.111"),
                  PhoneNumber(type: "Arbeit", number: "0031.3232.111"),
                  PhoneNumber(type: "Work", number: "0041.3232.111"),
                  PhoneNumber(type: "Fix", number: "0051.3232.111"),
                  PhoneNumber(type: "Personal", number: "0061.3232.111"),
                  PhoneNumber(type: "Mobile2", number: "0071.3232.111"),
                  PhoneNumber(type: "Work", number: "0081.3232.111"),
                  PhoneNumber(type: "Festnet", number: "0091.3232.111"),
                  PhoneNumber(type: "none", number: "0001.3232.111")]

        var cells: [UITableViewCell] = []
        for i in 0 ..< pn.count {
            guard let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell") as? TextFieldCell else { return }
            textFieldCell.phoneNumber = pn[i]
            textFieldCell.textField.delegate = textFieldCell
            textFieldCell.delegate = self
            cells.append(textFieldCell)
        }

        let pnSection = Section.init(headerString: "", cells: cells, headerView: headerView)
        sections.append(pnSection)
    }
}

extension ViewModel: PhoneNumberDelegate {
    func phoneNumberDidChange(_ phoneNumber: PhoneNumber) {
        print("saving phoneNumber = \(phoneNumber.type) \(phoneNumber.number)")

        //TODO: implement saving logic
    }
}
