//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <LinkPresentation/LPMetadataProviderSpecialization.h>

@class LPLinkMetadata, LPURLFetcher;


@interface LPRedditMetadataProviderSpecialization : LPMetadataProviderSpecialization
{
    BOOL _cancelled;
    LPURLFetcher *_fetcher;
    LPLinkMetadata *_metadata;
    id _completionHandler;
}

+ (BOOL)generateSpecializedMetadataForCompleteMetadata:(id)arg1 withContext:(id)arg2 completionHandler:(id)arg3;
+ (unsigned long long)specialization;


@end

