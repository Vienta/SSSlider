//
//  SSSlider.m
//  SSSlider
//
//  Created by 束 永兴 on 13-9-16.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "SSSlider.h"


#define SLIDER_HEIGHT 30
#define SLIDER_WIDTH 30
#define INNER_SIZE 5

@implementation SSSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, SLIDER_HEIGHT)];
    if (self) {
        // Initialization code
        /*
        self.clipsToBounds = NO;
        
        //default value
        _minimumValue = 0.0;
        _maximumValue = 1.0;
        self.backgroundColor = [UIColor clearColor];
         */
        /*
        //background
        _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, SLIDER_HEIGHT)];
        _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_backgroundImageView];
        */
        /*
        //trackimage
        _trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(INNER_SIZE, 0, frame.size.width - 2 *INNER_SIZE, SLIDER_HEIGHT)];
        _trackImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_trackImageView];
        if (!_trackImage) {
            _trackImage = [UIImage imageNamed:@"fullrange.png"];
        }
        _trackImageView.image = _trackImage;
        _trackImageView.frame = CGRectMake(INNER_SIZE, MAX((self.frame.size.height-_trackImage.size.height)/2.0,0), self.frame.size.width-2*INNER_SIZE, MIN(self.frame.size.height,_trackImage.size.height));
         */
        /*
        _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SLIDER_HEIGHT - self.frame.size.height)/2.0, self.frame.size.height, self.frame.size.height)];
        _thumbImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_thumbImageView];
        if (!_thumbImage) {
            _thumbImage = [UIImage imageNamed:@"rangethumb"];
        }
        _thumbImageView.image = _thumbImage;
         */
        
        /*
        _orientation = SSSliderOrientationHorizontalLeft;
        _value = _minimumValue;
        */
        [self initSlider];
    }
    return self;
}

- (void)initSlider
{
    self.clipsToBounds = NO;
    _minimumValue = 0.0;
    _maximumValue = 1.0;
    _orientation = SSSliderOrientationHorizontalLeft;
    _value = _minimumValue;
}

- (void)drawRect:(CGRect)rect
{
    switch (_orientation) {
        case SSSliderOrientationHorizontalLeft:{
            [self sliderOrientationHorizontalLeft:rect];
        }
            break;
            
        case SSSliderOrientationHorizontalRight:{
            [self sliderOrientationHorizontalRight:rect];
        }
            break;
        case SSSliderOrientationVerticalBottom: {
        
        }
            break;
        case SSSliderOrientationVerticalTop:{
        
        }
            break;
        default:
            [self sliderOrientationHorizontalLeft:rect];
            break;
    }
   
}

- (void)sliderOrientationHorizontalLeft:(CGRect)rect
{
    //background
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, SLIDER_HEIGHT)];
    _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_backgroundImageView];
    //trackimage
    _trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(INNER_SIZE, 0, rect.size.width - 2 *INNER_SIZE, SLIDER_HEIGHT)];
    _trackImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_trackImageView];
    if (!_trackImage) {
        _trackImage = [UIImage imageNamed:@"fullrange.png"];
    }
    _trackImageView.image = _trackImage;
    _trackImageView.frame = CGRectMake(INNER_SIZE, MAX((self.frame.size.height-_trackImage.size.height)/2.0,0), self.frame.size.width-2*INNER_SIZE, MIN(self.frame.size.height,_trackImage.size.height));
    
    _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SLIDER_HEIGHT - self.frame.size.height)/2.0, self.frame.size.height, self.frame.size.height)];
    _thumbImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_thumbImageView];
    if (!_thumbImage) {
        _thumbImage = [UIImage imageNamed:@"rangethumb"];
    }
    _thumbImageView.image = _thumbImage;
}

- (void)sliderOrientationHorizontalRight:(CGRect)rect
{
    //background
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, SLIDER_HEIGHT)];
    _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_backgroundImageView];
    
    //trackimage
    _trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(INNER_SIZE, 0, rect.size.width - 2 *INNER_SIZE, SLIDER_HEIGHT)];
    _trackImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_trackImageView];
    if (!_trackImage) {
        _trackImage = [UIImage imageNamed:@"fullrange.png"];
    }
    _trackImageView.image = _trackImage;
    _trackImageView.frame = CGRectMake(INNER_SIZE, MAX((self.frame.size.height-_trackImage.size.height)/2.0,0), self.frame.size.width-2*INNER_SIZE, MIN(self.frame.size.height,_trackImage.size.height));
    
    _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-self.frame.size.height, (SLIDER_HEIGHT - self.frame.size.height)/2.0, self.frame.size.height, self.frame.size.height)];
    _thumbImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_thumbImageView];
    if (!_thumbImage) {
        _thumbImage = [UIImage imageNamed:@"rangethumb"];
    }
    _thumbImageView.image = _thumbImage;
}

- (void)setTrackImage:(UIImage *)image
{
    SAFE_ARC_RELEASE(image);
    _trackImage = SAFE_ARC_RETAIN(image);
}

- (UIImage *)trackImage
{
    if (!_trackImage) {
        _trackImage = [UIImage imageNamed:@"fullrange"];
    }
    return _trackImage;
}

- (void)setThumbImage:(UIImage *)thumbImage
{
    SAFE_ARC_RELEASE(thumbImage);
    _thumbImage = SAFE_ARC_RETAIN(thumbImage);
}

- (UIImage *)thumbImage
{
    if (!_thumbImage) {
        _thumbImage = [UIImage imageNamed:@"rangethumb"];
    }
    return _thumbImage;
}

- (double)value
{
    return _value;
}

- (void)setValue:(double)value
{
    SAFE_ARC_RELEASE(value);
    _value = value;
    NSAssert(_value >= _minimumValue, @"slider current value can not less than minimumValue");
    float per = (_value - _minimumValue) / (_maximumValue - _minimumValue);
    float thumbX = per * self.frame.size.width - self.frame.size.height/2;
    _thumbImageView.frame = CGRectMake(thumbX, _thumbImageView.frame.origin.y, _thumbImageView.frame.size.width, _thumbImageView.frame.size.height);
}

- (void)setMaximumValue:(double)maximumValue
{
    SAFE_ARC_RELEASE(maximumValue);
    _maximumValue = maximumValue;
}

- (double)maximumValue
{
    return _maximumValue;
}

- (void)setMinimumValue:(double)minimumValue
{
    SAFE_ARC_RELEASE(minimumValue);
    _minimumValue = minimumValue;
    _value = _minimumValue;
}

- (double)minimumValue
{
    return _minimumValue;
}

- (void)calculateCurrentValue
{
    NSAssert(_maximumValue >= _minimumValue, @"slider maximumValue can not less than minimumValue");
    double per = MAX(0, _thumbImageView.frame.origin.x/(self.frame.size.width - 1.0 *self.frame.size.height));
    double curValue = _minimumValue + per * (_maximumValue - _minimumValue);
    if (curValue != _value) {
        _value = curValue;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    
    float dltX = [touch locationInView:self].x - [touch previousLocationInView:self].x;
    if (_orientation == SSSliderOrientationHorizontalLeft) {
        float newX = MAX(
                         0,
                         MIN(
                             _thumbImageView.frame.origin.x+dltX,
                             self.frame.size.width-self.frame.size.height)
                         );
        _thumbImageView.frame = CGRectMake(newX, _thumbImageView.frame.origin.y, _thumbImageView.frame.size.width, _thumbImageView.frame.size.height);
    }else if (_orientation == SSSliderOrientationHorizontalRight) {
//        float newX = MAX(
//						 self.frame.size.height+minimumRangeLength*(self.frame.size.width-self.frame.size.height*2.0),
//						 MIN(
//							 maxSlider.frame.origin.x+dltX,
//							 self.frame.size.width-self.frame.size.height)
//						 );
    }
    
    NSLog(@"当前value:%f", _value);
    [self calculateCurrentValue];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}


@end
