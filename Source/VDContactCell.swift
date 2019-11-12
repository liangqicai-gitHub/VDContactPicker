//
//  ContactCell.swift
//  VDContactPicker
//

import UIKit

class VDContactCell: UITableViewCell {
    @IBOutlet weak var contactTextLabel: UILabel!
    @IBOutlet weak var contactDetailTextLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactInitialLabel: UILabel!
    @IBOutlet weak var contactContainerView: UIView!

    var contact: VDContact?

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = UITableViewCellSelectionStyle.none
        contactContainerView.layer.masksToBounds = true
        contactContainerView.layer.cornerRadius = contactContainerView.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateInitialsColorForIndexPath(_ indexpath: IndexPath) {
        //Applies color to Initial Label
        let colorArray = VDGlobalConstants.shared.colors
        let randomValue = (indexpath.row + indexpath.section) % colorArray.count
        contactInitialLabel.backgroundColor = colorArray[randomValue]
    }

    func updateContactsinUI(_ contact: VDContact, indexPath: IndexPath, subtitleType: SubtitleCellValue) {
        self.contact = contact
        //Update all UI in the cell here
        self.contactTextLabel?.text = contact.displayName
        updateSubtitleBasedonType(subtitleType, contact: contact)
        if contact.thumbnailProfileImage != nil {
            self.contactImageView?.image = contact.thumbnailProfileImage
            self.contactImageView.isHidden = false
            self.contactInitialLabel.isHidden = true
        } else {
            self.contactInitialLabel.text = contact.initials
            updateInitialsColorForIndexPath(indexPath)
            self.contactImageView.isHidden = true
            self.contactInitialLabel.isHidden = false
        }
    }

    func updateSubtitleBasedonType(_ subtitleType: SubtitleCellValue , contact: VDContact) {

        switch subtitleType {

        case SubtitleCellValue.phoneNumber:
            let phoneNumberCount = contact.phoneNumbers.count

            if phoneNumberCount >= 1  {
                var numbers = [String]()
                for one in contact.phoneNumbers {
                    numbers.append(one.phoneNumber)
                }
                self.contactDetailTextLabel.text = (numbers as NSArray).componentsJoined(by: ",")
            }else {
                self.contactDetailTextLabel.text = VDGlobalConstants.shared.phoneNumberNotAvailable
            }
        case SubtitleCellValue.email:
            let emailCount = contact.emails.count

            if emailCount == 1  {
                var numbers = [String]()
                for one in contact.emails {
                    numbers.append(one.email)
                }
                self.contactDetailTextLabel.text = (numbers as NSArray).componentsJoined(by: ",")
            }
            else {
                self.contactDetailTextLabel.text = VDGlobalConstants.shared.emailNotAvailable
            }
        case SubtitleCellValue.birthday:
            self.contactDetailTextLabel.text = contact.birthdayString
        case SubtitleCellValue.organization:
            self.contactDetailTextLabel.text = contact.company
        }
    }
}
