Pod::Spec.new do |s|
s.name             = "VDContactPicker"
s.module_name      = "VDContactPicker"
s.version          = "2.0.2"
s.summary          = "A contacts picker component for iOS written in swift using new contacts framwork. Based on 'JFContactPicker'."
s.description      = <<-DESC
Features
[x] Single selection and multi-selection options.
[x] Search Contacts
[x] Configure the contact data to be shown. (Phone Number, Email, Birthday, or Organization)
[x] Section indexes to easily navigate through the contacts.
[x] Shows initials when image is not available.
[x] Contact object to get the properties of the contacts
DESC

s.homepage         = "https://github.com/vdeep/VDContactPicker"
s.license          = 'MIT'
s.authors          = { "Vishal Deep" => "vishal.deep@live.com" }
s.source           = { :git => "https://github.com/vdeep/VDContactPicker.git", :tag => s.version.to_s }
s.platform         = :ios, '9.0'
s.requires_arc     = true

s.frameworks       = 'Contacts', 'ContactsUI'

s.source_files     = 'Source'
s.resource_bundles = { 'VDContactPicker' => ['Assets/*.xib'] }

s.swift_version    = "4.1"

end
