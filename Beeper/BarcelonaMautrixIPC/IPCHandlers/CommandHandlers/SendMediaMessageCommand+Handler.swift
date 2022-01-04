//
//  SendMediaMessageCommand+Handler.swift
//  BarcelonaFoundation
//
//  Created by Eric Rabil on 8/23/21.
//  Copyright © 2021 Eric Rabil. All rights reserved.
//

import Foundation
import Barcelona
import IMCore

public protocol Runnable {
    func run(payload: IPCPayload)
}

extension SendMediaMessageCommand: Runnable {
    public func run(payload: IPCPayload) {
        guard let chat = cbChat else {
            return payload.fail(strategy: .chat_not_found)
        }
        
        let transfer = CBInitializeFileTransfer(filename: file_name, path: URL(fileURLWithPath: path_on_disk)), transferGUID = transfer.guid
        let messageCreation = CreateMessage(parts: [
            .init(type: .attachment, details: transfer.guid)
        ])
        
        do {
            let message = try chat.send(message: messageCreation).partialMessage
            
            NotificationCenter.default.subscribe(toNotificationsNamed: [.IMFileTransferUpdated, .IMFileTransferFinished]) { notif, sub in
                guard let transfer = notif.object as? IMFileTransfer, transfer.guid == transferGUID else {
                    return
                }
                
                switch transfer.state {
                case .archiving:
                    break
                case .waitingForAccept:
                    break
                case .accepted:
                    break
                case .preparing:
                    break
                case .transferring:
                    break
                case .finalizing:
                    fallthrough
                case .finished:
                    sub.unsubscribe()
                    payload.respond(.message_receipt(message))
                case .error:
                    break
                case .recoverableError:
                    break
                case .unknown:
                    break
                }
            }
        } catch {
            // girl fuck
            CLFault("BLMautrix", "failed to send media message: %@", error as NSError)
        }
    }
}
