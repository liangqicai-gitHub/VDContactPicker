//
//  VDDefaultConstants.swift
//  VDContactPicker
//

import UIKit

open class VDDefaultConstants: VDConstantsProtocol {
    public var birthdayDateFormat = "MMM d"
    public var contactsTitle = "通讯录"
    public var phoneNumberNotAvailable = "无"
    public var emailNotAvailable = "无"
    public var bundleIdentifier = "VDContactPicker"
    public var cellNibIdentifier = "VDContactCell"

    private static let emerald = UIColor(red: (46/255), green: (204/255), blue: (113/255), alpha: 1.0)
    private static let sunflower = UIColor(red: (241/255), green: (196/255), blue: (15/255), alpha: 1.0)
    private static let pumpkin = UIColor(red: (211/255), green: (84/255), blue: (0/255), alpha: 1.0)
    private static let asbestos = UIColor(red: (127/255), green: (140/255), blue: (141/255), alpha: 1.0)
    private static let amethyst = UIColor(red: (155/255), green: (89/255), blue: (182/255), alpha: 1.0)
    private static let peterRiver = UIColor(red: (52/255), green: (152/255), blue: (219/255), alpha: 1.0)
    private static let pomegranate = UIColor(red: (192/255), green: (57/255), blue: (43/255), alpha: 1.0)

    public var colors = [
//        emerald,
//        sunflower,
//        pumpkin,
        asbestos,
//        amethyst,
//        peterRiver,
//        pomegranate
    ]

    public var alphabets = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","#"] //# indicates the names with numbers and blank spaces
}
