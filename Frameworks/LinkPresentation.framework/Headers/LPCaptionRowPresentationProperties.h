//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class LPCaptionButtonPresentationProperties, LPCaptionPresentationProperties;

@interface LPCaptionRowPresentationProperties : NSObject
{
    LPCaptionPresentationProperties *_leading;
    LPCaptionPresentationProperties *_trailing;
    LPCaptionButtonPresentationProperties *_button;
}


@property(retain, nonatomic) LPCaptionButtonPresentationProperties *button; // @synthesize button=_button;
- (void)applyToAllCaptions:(id)arg1;
@property(readonly, nonatomic) BOOL hasAnyContent;
- (id)right;
- (id)left;
@property(readonly, retain, nonatomic) LPCaptionPresentationProperties *trailing;
@property(readonly, retain, nonatomic) LPCaptionPresentationProperties *leading;
- (id)init;

@end

