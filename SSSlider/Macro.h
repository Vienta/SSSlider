//
//  Macro.h
//  macro
//
//  Created by 束 永兴 on 13-9-17.
//  Copyright (c) 2013年 RayAse. All rights reserved.
//

#ifndef macro_Macro_h
#define macro_Macro_h

#define iPhone4Inch CGSizeEqualToSize([[UIScreen mainScreen] preferredMode].size,CGSizeMake(640, 1136))
#define iPhone3Inch (iPhone && !iPhone4Inch)
#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define isRetina [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1
#define iPadRetina UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1
#define iPadUnRetina (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale <= 1)
#define IMG_SIZE (isRetina ? 0.5 : 1)

typedef enum {
    kSSResolutioniPhone,
    kSSResolutioniPhone3Inch,
    kSSResolutioniPhone4Inch,
    kSSResolutioniPad,
    kSSResolutioniPadRetina
}ssResolutionType;

#endif
