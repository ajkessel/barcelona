//
//  CBChatLeaf.swift
//  Barcelona
//
//  Created by Eric Rabil on 8/8/22.
//

import Foundation

/// Metadata for a single chat tracked by a logical conversation
public struct CBChatLeaf {
    /// The GUID for this chat
    public var guid: String = ""
    /// The chat identifier for this chat
    public var chatIdentifier: String = ""
    /// The service for this chat
    public var service: CBServiceName = .None
    /// Whether a valid IDS availability response has been gathered for this chat
    public var hasHadSuccessfulQuery: Bool = false
    /// Whether messages should be sent as SMS in this chat
    public var shouldForceToSMS: Bool = false
    /// The date of the last-sent message in this chat
    public var lastSentMesageDate: Date = .distantPast
    /// The groupID for this chat
    public var groupID: String = ""
    /// The original groupID for this chat (sometimes different from groupID)
    public var originalGroupID: String = ""
    /// An array of participants for this chat
    public var participants: [CBChatParticipant] = []
    /// The sender correlation identifier for this chat
    public var correlationID: String = ""
    
    /// Returns the identifier with the most specificity for this chat
    public var mostUniqueIdentifier: CBChatIdentifier? {
        if !guid.isEmpty {
            return .guid(guid)
        }
        if !groupID.isEmpty {
            return .groupID(groupID)
        }
        if !chatIdentifier.isEmpty {
            return .chatIdentifier(chatIdentifier)
        }
        if !originalGroupID.isEmpty {
            return .originalGroupID(originalGroupID)
        }
        if !correlationID.isEmpty {
            return .correlationID(correlationID)
        }
        return nil
    }
    
    /// Invokes a callback with all identifiers present on this chat
    public func forEachIdentifier(_ callback: (CBChatIdentifier) throws -> ()) rethrows {
        if !guid.isEmpty {
            try callback(.guid(guid))
        }
        if !chatIdentifier.isEmpty {
            try callback(.chatIdentifier(chatIdentifier))
        }
        if !groupID.isEmpty {
            try callback(.groupID(groupID))
        }
        if !originalGroupID.isEmpty {
            try callback(.originalGroupID(originalGroupID))
        }
        if !correlationID.isEmpty {
            try callback(.correlationID(correlationID))
        }
    }
    
    /// Updates the struct with only the identifiable information from the provided dictionary
    @discardableResult mutating func handle(identifiable dictionary: [AnyHashable: Any]) -> Self {
        guid = dictionary["guid"] as? String ?? guid
        chatIdentifier = dictionary["chatIdentifier"] as? String ?? chatIdentifier
        groupID = dictionary["groupID"] as? String ?? groupID
        originalGroupID = dictionary["originalGroupID"] as? String ?? originalGroupID
        if let participants = dictionary["participants"] as? [[AnyHashable: Any]] {
            self.participants = participants.compactMap(CBChatParticipant.init(dictionary:))
            if (dictionary["style"] as? UInt8) == 45, self.participants.count == 1 {
                let uri = (self.participants[0].personID as NSString)._bestGuessURIFromCanicalizedID() as! String
                correlationID = CBSenderCorrelationController.shared.correlate(sameSenders: [uri], offline: true, hitDatabase: false) ?? ""
            } else {
                correlationID = ""
            }
        }
        return self
    }
    
    /// Updates the struct with data from the provided dictionary
    @discardableResult public mutating func handle(dictionary: [AnyHashable: Any]) -> Self {
        handle(identifiable: dictionary)
        service = (dictionary["serviceName"] as? String).flatMap(CBServiceName.init(rawValue:)) ?? service
        hasHadSuccessfulQuery = dictionary["hasHadSuccessfulQuery"] as? Bool ?? hasHadSuccessfulQuery
        if let properties = dictionary["properties"] as? [AnyHashable: Any] {
            handle(properties: properties)
        }
        return self
    }
    
    /// Updates the struct with data from the provided properties
    @discardableResult public mutating func handle(properties: [AnyHashable: Any]) -> Self {
        lastSentMesageDate = properties["LSMD"] as? Date ?? lastSentMesageDate
        shouldForceToSMS = properties["shouldForceToSMS"] as? Bool ?? shouldForceToSMS
        return self
    }
}

#if canImport(IMCore)
import IMCore

public extension CBChatLeaf {
    var IMChat: IMChat? {
        return mostUniqueIdentifier?.IMChat
    }
}
#endif
