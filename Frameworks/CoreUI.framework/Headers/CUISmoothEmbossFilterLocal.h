//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <CoreImage/CIFilter.h>

@class CIColor, CIImage, NSNumber;

__attribute__((visibility("hidden")))
@interface CUISmoothEmbossFilterLocal : CIFilter
{
    CIImage *inputImage;
    NSNumber *inputRadius;
    NSNumber *inputAngle;
    NSNumber *inputAltitude;
    CIColor *inputHighlightColor;
    CIColor *inputShadowColor;
}

+ (id)filterWithName:(id)arg1;
@property(retain, nonatomic) CIColor *inputShadowColor; // @synthesize inputShadowColor;
@property(retain, nonatomic) CIColor *inputHighlightColor; // @synthesize inputHighlightColor;
@property(retain, nonatomic) NSNumber *inputAltitude; // @synthesize inputAltitude;
@property(retain, nonatomic) NSNumber *inputAngle; // @synthesize inputAngle;
@property(retain, nonatomic) NSNumber *inputRadius; // @synthesize inputRadius;
@property(retain, nonatomic) CIImage *inputImage; // @synthesize inputImage;
- (id)outputImage;
- (id)customAttributes;
- (void)dealloc;

@end

