//
//  RNDocumentInteractionController.m
//  RNDocumentInteractionController
//
//  Created by Aaron Greenwald on 7/5/16.
//  Copyright © 2016 Wix.com. All rights reserved.
//

#import "RNDocumentInteractionController.h"
#import <UIKit/UIKit.h>

@implementation RNDocumentInteractionController

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(preview:(NSString *)fileURL resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    NSURL *url = [NSURL fileURLWithPath:[fileURL stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]]];

    UIDocumentInteractionController *viewController = [UIDocumentInteractionController interactionControllerWithURL:url];
    
    viewController.delegate = self;
    
    if (![viewController respondsToSelector:@selector(presentPreviewAnimated:)]) {
        NSError *error = [[NSError alloc] init];
        reject(@"cannot_preview", @"Can not preview", error);
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            BOOL canOpen = [viewController presentPreviewAnimated:YES];
            NSMutableArray *result = [[NSMutableArray alloc] init];
            if(canOpen) resolve(result);
            else {
                NSError *error = [[NSError alloc] init];
                reject(@"cannot_handle_file", @"Can not handle file", error);
            }
        });
    }
}


@end

