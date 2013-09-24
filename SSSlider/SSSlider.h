//
//  SSSlider.h
//  SSSlider
//
//  Created by 束 永兴 on 13-9-16.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SSSliderOrientation) {
    SSSliderOrientationHorizontalLeft,
    SSSliderOrientationHorizontalRight,
    SSSliderOrientationVerticalTop,
    SSSliderOrientationVerticalBottom,
};

@interface SSSlider : UIControl
{
    UIImageView *_backgroundImageView;
    UIImage *_trackImage;
    UIImage *_thumbImage;
    UIImage *_minimumTrackImage;
    UIImage *_maximumTrackImage;
    double _value;
    double _minimumValue;
    double _maximumValue;
    SSSliderOrientation _orientation;
}

@property (nonatomic) double minimumValue;
@property (nonatomic) double maximumValue;
@property (nonatomic) double value;
@property (nonatomic) SSSliderOrientation orientation;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImageView *trackImageView;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImageView *thumbImageView;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImageView *minimumTrackImageView;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImageView *maximumTrackImageView;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIColor *minimumTrackTintColor;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIColor *maximumTrackTintColor;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImage *trackImage;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImage *thumbImage;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImage *minimumTrackImage;
@property (nonatomic, SAFE_ARC_PROP_RETAIN) UIImage *maximumTrackImage;

- (void)setTrackImage:(UIImage *)image;
- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state;
- (id)initVerticalWithFrame:(CGRect)frame;
@end
