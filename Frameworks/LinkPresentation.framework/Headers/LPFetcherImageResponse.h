//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <LinkPresentation/LPFetcherResponse.h>

#import "LPFetcherURLResponse.h"

@class LPImage, NSString;


@interface LPFetcherImageResponse : LPFetcherResponse <LPFetcherURLResponse>
{
    LPImage *_image;
}

+ (id)responseForFetcher:(id)arg1 withData:(id)arg2 MIMEType:(id)arg3;
+ (id)imagePropertiesForFetcher:(id)arg1;
+ (BOOL)isValidMIMEType:(id)arg1;

@property(readonly, retain, nonatomic) LPImage *image; // @synthesize image=_image;
- (id)initWithImage:(id)arg1 fetcher:(id)arg2;

// Remaining properties
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long hash;
@property(readonly) Class superclass;

@end

