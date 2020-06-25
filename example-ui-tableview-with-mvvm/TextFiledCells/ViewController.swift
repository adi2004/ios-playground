//
//  ViewController.swift
//  TextFiledCells
//
//  Created by Adrian Florescu on 12.09.17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var viewModel: ViewModel!
    @IBOutlet var pnHeaderView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel(tableView, pnHeaderView)

        // notifications
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(ViewController.hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(ViewController.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editAction(_ sender: Any) {
        print("Edit pressed")
        tableView.setEditing(!tableView.isEditing, animated: true)
    }

    // MARK: - Keyboard handeling functions
    /// Moves the interface up if the keyboard hides one of the text fields.
    /// Technique taken from:
    /// https://developer.apple.com/library/content/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html#//apple_ref/doc/uid/TP40009542-CH5-SW7
    @objc func keyboardWillShow(_ notification: Notification) {
        print("keyboardWillShow")
        let info = notification.userInfo
        let keyboardFrame = info?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        guard let keyboardHeight = keyboardFrame?.cgRectValue.height else { return }

        let contentInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: keyboardHeight, right: 0)

        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        print("keyboardWillHide")
        self.tableView.contentInset = UIEdgeInsets.zero
    }

    @objc func hideKeyboard() {
        print("hideKeyboard")
        view.endEditing(true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewModel.sections[section].headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect.zero)
//        let height = NSLayoutConstraint.init(item: self, attribute: .height, relatedBy:
//            .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0)
        let constraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(constraint)
        view.backgroundColor = UIColor.black
        return view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].headerString
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section > 0
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.sections[indexPath.section].cells[indexPath.row]
    }
}
