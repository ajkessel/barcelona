//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <LinkPresentation/LPFetcherResponse.h>

@class NSError;


@interface LPFetcherErrorResponse : LPFetcherResponse
{
    NSError *_error;
}


@property(readonly, retain, nonatomic) NSError *error; // @synthesize error=_error;
- (id)initWithError:(id)arg1 fetcher:(id)arg2;

@end

