//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

#import <Foundation/Foundation.h>

@class AVAssetWriter, AVAssetWriterInput, AVAssetWriterInputPixelBufferAdaptor, LPImage, NSURL;


@interface LPAnimatedImageTranscoder : NSObject
{
    LPImage *_sourceImage;
    id _completionHandler;
    struct CGImageSource *_imageSource;
    NSURL *_outputURL;
    unsigned long long _frameCount;
    unsigned long long _currentFrame;
    double _nextFrameTime;
    AVAssetWriterInputPixelBufferAdaptor *_adaptor;
    AVAssetWriter *_writer;
    AVAssetWriterInput *_input;
    BOOL _stopEncoding;
    BOOL _hasReadyForDataObserver;
    unsigned int _loggingID;
}

+ (id)encodeQueue;

- (void)cancel;
- (void)encodeNextFrame;
- (void)encodeUntilNotReadyForMoreMediaData;
- (void)removeReadyForDataObserverIfNeeded;
- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
- (void)failed;
- (void)_transcodeWithCompletionHandler:(id)arg1;
- (void)transcodeWithCompletionHandler:(id)arg1;
- (id)initWithAnimatedImage:(id)arg1;

@end

