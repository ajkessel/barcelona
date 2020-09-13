//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class NSString, NSURL, WKWebView;


@interface LPMetadataProviderSpecializationContext : NSObject
{
    BOOL _hasLoadedResource;
    BOOL _shouldFetchSubresources;
    NSURL *_URL;
    NSString *_MIMEType;
    WKWebView *_webView;
    unsigned long long _allowedSpecializations;
}


@property(readonly, nonatomic) unsigned long long allowedSpecializations; // @synthesize allowedSpecializations=_allowedSpecializations;
@property(readonly, retain, nonatomic) WKWebView *webView; // @synthesize webView=_webView;
@property(readonly, nonatomic) BOOL shouldFetchSubresources; // @synthesize shouldFetchSubresources=_shouldFetchSubresources;
@property(readonly, nonatomic) BOOL hasLoadedResource; // @synthesize hasLoadedResource=_hasLoadedResource;
@property(readonly, copy, nonatomic) NSString *MIMEType; // @synthesize MIMEType=_MIMEType;
@property(readonly, copy, nonatomic) NSURL *URL; // @synthesize URL=_URL;
- (id)initWithURL:(id)arg1 MIMEType:(id)arg2 webView:(id)arg3 hasLoadedResource:(BOOL)arg4 shouldFetchSubresources:(BOOL)arg5 allowedSpecializations:(unsigned long long)arg6;

@end

