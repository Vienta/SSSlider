//
//  UIImage+PullImage.m
//  iOS7Pic
//
//  Created by 束 永兴 on 13-9-18.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "UIImage+PullImage.h"
#import "Macro.h"

@implementation UIImage (PullImage)

+ (UIImage *)imageFilename:(NSString *)name
{
    NSAssert(name != NULL, @"png name can not be null");
    NSString *filetype = @".png";
    NSString *filename;
    if ([name hasSuffix:filetype]) {
        name = [name substringToIndex:name.length - filetype.length];
    }
    if ([name hasPrefix:@"@ipadhd"]) {
        name = [name substringToIndex:name.length - @"@ipadhd".length];
    }
    if ([name hasPrefix:@"@hd"]) {
        name = [name substringToIndex:name.length - @"@hd".length];
    }
    if ([name hasPrefix:@"@568hd"]) {
        name = [name substringToIndex:name.length - @"@568hd".length];
    }
    BOOL isPad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
    BOOL retina = ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1);
    BOOL isPhone5 = CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(640, 1136));
    if (isPad) {
        if (retina) {
            filename = [NSString stringWithFormat:@"%@@ipadhd",name];
        } else {
            filename = [NSString stringWithFormat:@"%@@hd",name];
        }
    } else {
        if (retina) {
            if (isPhone5) {
                filename = [NSString stringWithFormat:@"%@@568hd",name];
                NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
                if (!path) {
                    filename = [NSString stringWithFormat:@"%@@hd",name];
                }
            } else {
                filename = [NSString stringWithFormat:@"%@@hd",name];
            }
        } else {
            filename = [NSString stringWithFormat:@"%@",name];
        }
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
    NSAssert(filePath != nil, @"file not find, make sure you file name is correct.");
    return [UIImage imageWithContentsOfFile:filePath];
}

@end