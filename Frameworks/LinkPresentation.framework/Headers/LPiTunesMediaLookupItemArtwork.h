//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSDictionary;


@interface LPiTunesMediaLookupItemArtwork : NSObject
{
    NSDictionary *_dictionary;
}

+ (id)colorForColorKind:(id)arg1 inColorDictionary:(id)arg2;

- (id)URLWithHeight:(long long)arg1 width:(long long)arg2 cropStyle:(id)arg3 format:(id)arg4;
- (id)colors;
@property(readonly, nonatomic) long long width;
@property(readonly, nonatomic) long long height;
- (id)initWithDictionary:(id)arg1;

@end

