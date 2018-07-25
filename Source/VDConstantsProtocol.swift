//
//  VDConstantsProtocol.swift
//  VDContactPicker
//

import UIKit

public protocol VDConstantsProtocol {
    // MARK: string constants
    var birthdayDateFormat: String { get }
    var contactsTitle: String { get }
    var phoneNumberNotAvailable: String { get }
    var emailNotAvailable: String { get }
    var bundleIdentifier: String { get }
    var cellNibIdentifier: String { get }

    // MARK: colors
    var colors: [UIColor] { get }

    // MARK: alphabets
    var alphabets: [String] { get }
}
