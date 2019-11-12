//
//  ViewController.swift
//  VDContactPicker
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

// MARK: Instance methods
extension ViewController {

    fileprivate func showAlert(_ title: String?, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true)
    }

}

// MARK: IBActions
extension ViewController {

    @IBAction fileprivate func showSingleContactPicker(_ sender: AnyObject) {
        let contactPickerScene = VDContactPicker(delegate: self, multiSelection: false, subtitleCellType: SubtitleCellValue.phoneNumber)
        let navigationController = UINavigationController(rootViewController: contactPickerScene)
        self.present(navigationController, animated: true, completion: nil)
    }

    @IBAction fileprivate func showMultipleContactPicker(_ sender: AnyObject) {
        let contactPickerScene = VDContactPicker(delegate: self, multiSelection: true, subtitleCellType: SubtitleCellValue.email)
        let navigationController = UINavigationController(rootViewController: contactPickerScene)
        self.present(navigationController, animated: true, completion: nil)
    }

}

// MARK: VDContactPickerDelegate
extension ViewController: VDContactPickerDelegate {

    func contactPicker(_ contactPicker: VDContactPicker, didContactFetchFailed error: NSError) {
        print(">> Failed with error \(error.description)")

        contactPicker.dismiss(animated: true) { [weak self] in
            self?.showAlert("Error", error.description)
        }
    }

    func contactPicker(_ contactPicker: VDContactPicker, didSelectContact contact: VDContact) {
        print(">> Contact \(contact.displayName) has been selected")

        contactPicker.dismiss(animated: true) { [weak self] in
            self?.showAlert("Single selection", contact.displayName)
        }
    }

    func contactPicker(_ contactPicker: VDContactPicker, didCancel error: NSError) {
        print(">> User canceled the selection");

        contactPicker.dismiss(animated: true) { [weak self] in
            self?.showAlert("Cancelled", "User cancelled the selection")
        }
    }

    func contactPicker(_ contactPicker: VDContactPicker, didSelectMultipleContacts contacts: [VDContact]) {
        print(">> The following contacts are selected")

        for contact in contacts {
            print("\(contact.displayName)")
        }

        let message = contacts.compactMap { $0.displayName }.joined(separator: "\n")

        contactPicker.dismiss(animated: true) { [weak self] in
            self?.showAlert("Multiple selection", message)
        }
    }

}
