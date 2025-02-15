//
//  Chat+@everyone.swift
//  Barcelona
//
//  Created by Eric Rabil on 2/27/22.
//

import Foundation

internal extension String {
    var cb_isOneOfMyHandles: Bool {
        Registry.sharedInstance.allMeHandles.map(\.id).contains(self)
    }
}

public extension Chat {
    enum AtEveryoneError: Error {
        case textTooShort
    }
    
    func pingEveryone(text: String) throws -> Message {
        let targetParticipants = participants.filter {
            !$0.cb_isOneOfMyHandles
        }
        guard text.count >= targetParticipants.count else {
            throw AtEveryoneError.textTooShort
        }
        var parts: [MessagePart] = []
        var textStorage = text
        for (index, participant) in targetParticipants.enumerated() {
            if index == targetParticipants.count - 1 {
                parts.append(.init(type: .text, details: textStorage, attributes: [.mention(participant)]))
            } else {
                parts.append(.init(type: .text, details: String(textStorage.removeFirst()), attributes: [.mention(participant)]))
            }
        }
        return try send(message: .init(parts: parts))
    }
}
