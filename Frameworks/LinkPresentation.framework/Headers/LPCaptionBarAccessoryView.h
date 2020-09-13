//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <LinkPresentation/LPComponentView.h>

@class NSColor, NSImageView;


@interface LPCaptionBarAccessoryView : LPComponentView
{
    long long _type;
    BOOL _shouldFlipHorizontally;
    NSColor *_color;
    NSImageView *_accessoryView;
}


- (id)_createImageViewWithImage:(id)arg1;
@property(readonly, nonatomic) struct CGSize size;
- (void)layoutComponentView;
- (id)ensureAccessoryView;
- (void)componentViewDidMoveToWindow;
- (id)initWithType:(long long)arg1 side:(long long)arg2;
- (id)init;

@end

