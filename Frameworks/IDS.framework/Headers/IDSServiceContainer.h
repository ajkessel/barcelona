//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class IDSServiceMonitor, NSMutableSet;

@interface IDSServiceContainer : NSObject
{
    IDSServiceMonitor *_monitor;
    NSMutableSet *_listeners;
}


@property(readonly, nonatomic) NSMutableSet *listeners; // @synthesize listeners=_listeners;
@property(retain, nonatomic) IDSServiceMonitor *monitor; // @synthesize monitor=_monitor;
- (BOOL)removeListenerID:(id)arg1;
- (BOOL)addListenerID:(id)arg1;
- (BOOL)hasListenerID:(id)arg1;
- (id)initWithService:(id)arg1;

@end

