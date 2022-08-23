//
//  Contact.swift
//  imessage-rest
//
//  Created by Eric Rabil on 8/12/20.
//  Copyright © 2020 Eric Rabil. All rights reserved.
//

import Foundation
import Contacts
import IMCore

public struct BulkContactRepresentation: Codable, Hashable {
    public init(contacts: [Contact], strangers: [Handle]) {
        self.contacts = contacts
        self.strangers = strangers
    }
    
    var contacts: [Contact]
    var strangers: [Handle]
}

public struct Contact: Codable, Hashable, Comparable {
    public static func < (lhs: Contact, rhs: Contact) -> Bool {
        guard let lhsFullName = lhs.fullName else { return false }
        guard let rhsFullName = rhs.fullName else { return true }
        return lhsFullName < rhsFullName
    }
    
    public static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.id == rhs.id
    }
    
    public init(_ contact: CNContact) {
        self.id = contact.identifier
        self.firstName = contact.givenName.count == 0 ? nil : contact.givenName
        self.middleName = contact.middleName.count == 0 ? nil : contact.middleName
        self.lastName = contact.familyName.count == 0 ? nil : contact.familyName
        self.fullName = CNContactFormatter.string(from: contact, style: .fullName)
        self.nickname = contact.nickname.count == 0 ? nil : contact.nickname
        self.hasPicture = contact.thumbnailImageData != nil
        
        self.handles = contact.phoneNumbers.reduce(into: contact.emailAddresses.map { email in
            Handle(id: email.value as String)
        }) { (result, phoneNumber) in
            guard let countryCode = phoneNumber.value.value(forKey: "countryCode") as? String, let phoneNumber = phoneNumber.value.value(forKey: "digits") as? String else {
                return
            }
            guard let normalized = IMNormalizedPhoneNumberForPhoneNumber(phoneNumber, countryCode, true) else {
                return
            }
            result.append(Handle(id: "+\(normalized)"))
        }
    }
    
    public var id: String
    public var firstName: String?
    public var middleName: String?
    public var lastName: String?
    public var fullName: String?
    public var nickname: String?
    public var countryCode: String?
    public var hasPicture: Bool
    public var handles: [Handle]
    
    public var empty: Bool {
        return (self.firstName?.count ?? 0) == 0 && (self.middleName?.count ?? 0) == 0 && (self.lastName?.count ?? 0 == 0) && (self.nickname?.count ?? 0) == 0 && self.hasPicture == false
    }
    
    public mutating func addHandle(_ handle: Handle) {
        if handles.contains(handle) {
            return
        }
        handles.append(handle)
    }
}
