//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSURL;


@interface LPImageRemoteURLRepresentation : NSObject
{
    unsigned long long _scale;
    NSURL *_URL;
}


@property(readonly, retain, nonatomic) NSURL *URL; // @synthesize URL=_URL;
@property(readonly, nonatomic) unsigned long long scale; // @synthesize scale=_scale;
- (id)initWithScale:(unsigned long long)arg1 URL:(id)arg2;

@end

