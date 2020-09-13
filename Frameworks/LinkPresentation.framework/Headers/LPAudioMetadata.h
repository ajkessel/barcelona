//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

#import "LPMediaMetadata.h"
#import <Foundation/Foundation.h>

@class NSString, NSURL;

@interface LPAudioMetadata : NSObject
{
    unsigned int _version;
    NSURL *_URL;
    NSString *_type;
    NSString *_accessibilityText;
}

+ (BOOL)supportsSecureCoding;

@property(copy, nonatomic) NSString *accessibilityText; // @synthesize accessibilityText=_accessibilityText;
@property(copy, nonatomic) NSString *type; // @synthesize type=_type;
@property(copy, nonatomic) NSURL *URL; // @synthesize URL=_URL;
@property(readonly, nonatomic) unsigned int version; // @synthesize version=_version;
@property(readonly) unsigned long hash;
- (BOOL)isEqual:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)_initWithDictionary:(id)arg1;
- (id)init;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) Class superclass;

@end

