//
//  CBChat+MessageHandling.swift
//  Barcelona
//
//  Created by Eric Rabil on 8/8/22.
//

import Foundation

#if canImport(IMSharedUtilities)
import IMSharedUtilities
#endif

public extension CBChat {
    enum MessageInput: CustomDebugStringConvertible, CustomStringConvertible {
        #if canImport(IMSharedUtilities)
        case item(IMItem)
        #endif
        case dict([AnyHashable: Any])
        
        public var guid: String? {
            switch self {
                #if canImport(IMSharedUtilities)
            case .item(let item): return item.id
                #endif
            case .dict(let dict): return dict["guid"] as? String
            }
        }
        
        public func handle(message: inout CBMessage?, leaf: CBChatIdentifier) -> CBMessage {
            switch self {
                #if canImport(IMSharedUtilities)
            case .item(let item):
                if message != nil {
                    message!.handle(item: item)
                    return message!
                }
                message = CBMessage(item: item, chat: leaf)
                return message!
                #endif
            case .dict(let dict):
                if message != nil {
                    message!.handle(dictionary: dict)
                    return message!
                }
                message = CBMessage(dictionary: dict, chat: leaf)
                return message!
            }
        }
        
        private var shared: CustomDebugStringConvertible & CustomStringConvertible {
            switch self {
                #if canImport(IMSharedUtilities)
            case .dict(let dict as CustomDebugStringConvertible & CustomStringConvertible), .item(let dict as CustomDebugStringConvertible & CustomStringConvertible):
                return dict
                #else
            case .dict(let dict as CustomDebugStringConvertible & CustomStringConvertible):
                return dict
                #endif
            }
        }
        
        public var debugDescription: String {
            shared.debugDescription
        }
        
        public var description: String {
            shared.description
        }
    }
    
    @discardableResult func handle(leaf: CBChatIdentifier, input item: MessageInput) -> CBMessage? {
        guard let id = item.guid else {
            log.warn("dropping message \(item.debugDescription, privacy: .private) as it has an invalid guid?!")
            return nil
        }
        let message = item.handle(message: &messages[id], leaf: leaf)
        log.info("handled message \(id, privacy: .public), \(message.debugDescription, privacy: .private)")
        return message
    }
    
    @discardableResult func handle(leaf: CBChatIdentifier, item dictionary: [AnyHashable: Any]) -> CBMessage? {
        handle(leaf: leaf, input: .dict(dictionary))
    }
}

#if canImport(IMSharedUtilities)
public extension CBChat {
    @discardableResult func handle(leaf: CBChatIdentifier, item: IMItem) -> CBMessage? {
        handle(leaf: leaf, input: .item(item))
    }
}
#endif
