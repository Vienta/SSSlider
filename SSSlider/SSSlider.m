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
    UIImage *trackImg = [UIImage imageFilename:@"rangethumb"];
    
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, trackImg.size.height*IMG_SIZE+2*INNER_SIZE)];
    
    if (self) {
        [self initSlider];
    }
    return self;
}

- (id)initVerticalWithFrame:(CGRect)frame
{
    UIImage *trackImg = [UIImage imageFilename:@"rangethumb"];
    NSLog(@"垂直开始:%@", NSStringFromCGRect(frame));
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, trackImg.size.width*IMG_SIZE+2*INNER_SIZE, frame.size.height)];
    if (self) {
        [self initVerticalSlider];
    }
    return self;
}
- (void)initVerticalSlider
{
    self.clipsToBounds = NO;
    _minimumValue = 0.0;
    _maximumValue = 1.0;
    _orientation = SSSliderOrientationVerticalBottom;
    _value = _minimumValue;
    self.backgroundColor = [UIColor clearColor];
}
- (void)initSlider
{
    self.clipsToBounds = NO;
    _minimumValue = 0.0;
    _maximumValue = 1.0;
    _orientation = SSSliderOrientationHorizontalLeft;
    _value = _minimumValue;
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"垂直dsafrect = %@",NSStringFromCGRect(rect));
    [super drawRect:rect];
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
            [self sliderOrientationVerticalBottom:rect];
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
    if (!_thumbImage) {
        _thumbImage = [UIImage imageFilename:@"rangethumb"];
    }
    CGSize thumbSize = _thumbImage.size;
    CGFloat thumbX = thumbSize.width *IMG_SIZE;
    CGFloat thumbY = thumbSize.height*IMG_SIZE;

    //background
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (rect.size.height - (thumbY + 2*INNER_SIZE))/2, rect.size.width, thumbY+2*INNER_SIZE)];
    _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_backgroundImageView];
    //track
    _trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(thumbX/2.0, 0, rect.size.width - thumbX, thumbY)];
    _trackImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_trackImageView];
    if (!_trackImage) {
        _trackImage = [UIImage imageFilename:@"fullrange"];
    }
    
    _trackImageView.image = _trackImage;
    _trackImageView.frame = CGRectMake(thumbX/2.0, (rect.size.height-_trackImage.size.height*IMG_SIZE)/2.0, rect.size.width-thumbX, MIN(rect.size.height,_trackImage.size.height*IMG_SIZE));
    
    //thumb
    float per = (_value - _minimumValue) / (_maximumValue - _minimumValue);
    float thumbOriginX = (self.frame.size.width - _thumbImage.size.width*IMG_SIZE)*per;
    _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(thumbOriginX, (rect.size.height - thumbY)/2.0, thumbX, thumbY)];
    _thumbImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_thumbImageView];
    _thumbImageView.image = _thumbImage;
    
    //right track
    _maximumTrackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_thumbImageView.center.x, 0, _trackImageView.bounds.size.width - (_thumbImageView.center.x-thumbX/2.0), thumbY)];
    _maximumTrackImageView.contentMode = UIViewContentModeScaleToFill;
    [self insertSubview:_maximumTrackImageView belowSubview:_thumbImageView];
    if (_maximumTrackImage) {
        _maximumTrackImageView.image = _maximumTrackImage;
        _maximumTrackImageView.frame = CGRectMake(_thumbImageView.center.x, (rect.size.height - _maximumTrackImage.size.height*IMG_SIZE)/2.0, rect.size.width - thumbX - _thumbImageView.center.x, _maximumTrackImage.size.height *IMG_SIZE);
    } else {
        if (_maximumTrackTintColor) {
            _maximumTrackImageView.backgroundColor = _maximumTrackTintColor;
            _maximumTrackImageView.bounds = CGRectMake(0, 0, _maximumTrackImageView.bounds.size.width, _trackImageView.bounds.size.height);
            _maximumTrackImageView.center = CGPointMake(_maximumTrackImageView.center.x, _trackImageView.center.y);
        }
    }
    
    //left track
    _minimumTrackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(thumbX/2.0, 0, _thumbImageView.center.x-thumbX/2.0, thumbY)];
    _minimumTrackImageView.contentMode = UIViewContentModeScaleToFill;
    [self insertSubview:_minimumTrackImageView belowSubview:_thumbImageView];
    if (_minimumTrackImage) {
        _minimumTrackImageView.image = [_minimumTrackImage stretchableImageWithLeftCapWidth:0 topCapHeight:0];
        _minimumTrackImageView.frame = CGRectMake(thumbX/2.0, (rect.size.height - _minimumTrackImage.size.height * IMG_SIZE)/2.0, _thumbImageView.center.x - thumbX/2.0, _minimumTrackImage.size.height *IMG_SIZE);
    } else {
        if (_minimumTrackTintColor) {
            _minimumTrackImageView.backgroundColor = _minimumTrackTintColor;
            _minimumTrackImageView.bounds = CGRectMake(0, 0, _minimumTrackImageView.bounds.size.width, _trackImageView.bounds.size.height);
            _minimumTrackImageView.center = CGPointMake(_minimumTrackImageView.center.x, _trackImageView.center.y);
        }
    }
}

- (void)sliderOrientationVerticalBottom:(CGRect)rect
{
    NSLog(@"垂直rect = %@",NSStringFromCGRect(rect));
    
    if (!_thumbImage) {
        _thumbImage = [UIImage imageFilename:@"rangethumb"];
    }
    CGSize thumbSize = _thumbImage.size;
    CGFloat thumbX = thumbSize.width*IMG_SIZE;
    CGFloat thumbY = thumbSize.height*IMG_SIZE;
    
    //background
    _backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake((rect.size.width - (thumbX+2*INNER_SIZE))/2, 0, thumbX + 2*INNER_SIZE, rect.size.height)];
    _backgroundImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_backgroundImageView];
    
    //track
    _trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, thumbY/2.0, thumbX, rect.size.height-thumbY)];
    _trackImageView.contentMode = UIViewContentModeScaleToFill;
    if (!_trackImage) {
        _trackImage = [UIImage imageFilename:@"fullrangev"];
    }
    _trackImageView.image = _trackImage;
    _trackImageView.frame = CGRectMake((rect.size.width - _trackImage.size.width*IMG_SIZE)/2.0, thumbY/2.0, MIN(rect.size.width, _trackImage.size.width*IMG_SIZE), rect.size.height - thumbY);
    [self addSubview:_trackImageView];
    
    //thumb
    float per = (_value - _minimumValue) / (_maximumValue - _minimumValue);
    float thumbOriginY = (rect.size.height - _thumbImage.size.height*IMG_SIZE)*per;
    
    _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake((rect.size.width - thumbX)/2.0, rect.size.height-thumbY-thumbOriginY, thumbX, thumbY)];
    _thumbImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_thumbImageView];
    _thumbImageView.image = _thumbImage;
    
    //right track
    _maximumTrackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, thumbY/2, thumbX, _thumbImageView.center.y)];
    _maximumTrackImageView.contentMode = UIViewContentModeScaleToFill;
    if (_maximumTrackImage) {
        _maximumTrackImageView.image = _maximumTrackImage;
        _maximumTrackImageView.frame = CGRectMake((rect.size.width - _maximumTrackImage.size.width*IMG_SIZE)/2.0, _thumbImageView.center.y, _maximumTrackImage.size.width*IMG_SIZE, rect.size.height - thumbY - _thumbImageView.center.y);
    } else {
        if (_maximumTrackTintColor) {
            _maximumTrackImageView.backgroundColor = _maximumTrackTintColor;
            _maximumTrackImageView.bounds = CGRectMake(0, 0, _trackImageView.bounds.size.width, _maximumTrackImageView.bounds.size.height);
            _maximumTrackImageView.center = CGPointMake(_trackImageView.center.x, _maximumTrackImageView.center.y);
        }
    }
    [self insertSubview:_maximumTrackImageView belowSubview:_thumbImageView];
    
    //left track
    _minimumTrackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _thumbImageView.center.y, thumbX, rect.size.height - thumbY/2.0 - _thumbImageView.center.y)];
    _minimumTrackImageView.contentMode = UIViewContentModeScaleToFill;
    if (_minimumTrackImage) {
        _minimumTrackImageView.image = _minimumTrackImage;
        _minimumTrackImageView.frame = CGRectMake((rect.size.width - _minimumTrackImage.size.width*IMG_SIZE)/2.0, rect.size.height - thumbY/2.0, _minimumTrackImage.size.width*IMG_SIZE, rect.size.height - _thumbImageView.center.y - thumbY/2.0);
    } else {
        if (_minimumTrackTintColor) {
            _minimumTrackImageView.backgroundColor = _minimumTrackTintColor;
            _minimumTrackImageView.bounds = CGRectMake(0, 0, _trackImageView.bounds.size.width, _minimumTrackImageView.bounds.size.height);
            _minimumTrackImageView.center = CGPointMake(_trackImageView.center.x, _minimumTrackImageView.center.y);
        }
    }
    [self insertSubview:_minimumTrackImageView belowSubview:_thumbImageView];
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
        _trackImage = [UIImage imageNamed:@"fullrange"];
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
    if (_orientation == SSSliderOrientationHorizontalLeft) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _thumbImage.size.height * IMG_SIZE);
    } else if (_orientation == SSSliderOrientationVerticalBottom) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _thumbImage.size.height*IMG_SIZE, self.frame.size.height);
    }
    
    [self setNeedsDisplay];
}

- (UIImage *)thumbImage
{
    if (!_thumbImage) {
        _thumbImage = [UIImage imageNamed:@"rangethumb"];
    }
    return _thumbImage;
}

- (void)setMinimumTrackImage:(UIImage *)minimumTrackImage
{
    SAFE_ARC_RELEASE(minimumTrackImage);
    _minimumTrackImage = SAFE_ARC_RETAIN(minimumTrackImage);
}

- (UIImage *)minimumTrackImage
{
    return _minimumTrackImage;
}

- (void)setMaximumTrackImage:(UIImage *)maximumTrackImage
{
    SAFE_ARC_RELEASE(maximumTrackImage);
    _maximumTrackImage = maximumTrackImage;
}

- (UIImage *)maximumTrackImage
{
    return _maximumTrackImage;
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
    CGSize thumbSize = _thumbImage.size;
    CGFloat thumbX = thumbSize.width *IMG_SIZE;
    CGFloat thumbY = thumbSize.height*IMG_SIZE;
    float per = (_value - _minimumValue) / (_maximumValue - _minimumValue);
    if (_orientation == SSSliderOrientationHorizontalLeft) {
        float thumbOriginX = (self.frame.size.width - _thumbImage.size.width*IMG_SIZE)*per;
        _thumbImageView.frame = CGRectMake(thumbOriginX, (self.bounds.size.height - thumbY)/2.0, thumbX, thumbY);
        _minimumTrackImageView.frame = CGRectMake(_minimumTrackImageView.frame.origin.x, _minimumTrackImageView.frame.origin.y, _thumbImageView.center.x - _minimumTrackImageView.frame.origin.x, _minimumTrackImageView.frame.size.height);
        _maximumTrackImageView.frame = CGRectMake(_thumbImageView.center.x, _maximumTrackImageView.frame.origin.y, _trackImageView.bounds.size.width - (_thumbImageView.center.x - _minimumTrackImageView.frame.origin.x),_maximumTrackImageView.frame.size.height);
    } else if (_orientation == SSSliderOrientationVerticalBottom) {
        float thumbOriginY = (self.bounds.size.height - _thumbImage.size.height*IMG_SIZE)*per;
        _thumbImageView.frame = CGRectMake((self.bounds.size.width - thumbX)/2.0, self.bounds.size.height - thumbY - thumbOriginY, thumbX, thumbY);
        _minimumTrackImageView.frame = CGRectMake(_minimumTrackImageView.frame.origin.x, _thumbImageView.center.y, _minimumTrackImageView.frame.size.width, self.bounds.size.height-_thumbImageView.image.size.height*IMG_SIZE/2 - _thumbImageView.center.y);
        _maximumTrackImageView.frame = CGRectMake(_maximumTrackImageView.frame.origin.x, _maximumTrackImageView.frame.origin.y, _maximumTrackImageView.frame.size.width, _thumbImageView.center.y - _thumbImageView.image.size.height*IMG_SIZE/2);
    }

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
    double per;
    double curValue;
    switch (_orientation) {
        case SSSliderOrientationHorizontalLeft:{
            per =  MAX(0, _thumbImageView.frame.origin.x/(self.frame.size.width - _thumbImageView.image.size.width*IMG_SIZE));
            curValue = _minimumValue + per * (_maximumValue - _minimumValue);
        }
            break;
        case SSSliderOrientationHorizontalRight:{
            per = MIN(1, 1-_thumbImageView.frame.origin.x/(self.frame.size.width - 1.0*self.frame.size.height));
            curValue = _minimumValue + per * (_maximumValue - _minimumValue);
        }
            break;
        case SSSliderOrientationVerticalBottom:{
            per =  MAX(0, (_thumbImageView.frame.origin.y)/(self.frame.size.height - _thumbImageView.image.size.height*IMG_SIZE));
            curValue = _minimumValue + (1-per) * (_maximumValue - _minimumValue);
        }
            break;
        default:{
            per =  MAX(0, _thumbImageView.frame.origin.x/(self.frame.size.width - 1.0 *self.frame.size.height));
            curValue = _minimumValue + per * (_maximumValue - _minimumValue);
        }
            break;
    }
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
    float dltY = [touch locationInView:self].y - [touch previousLocationInView:self].y;
    NSLog(@"dltY = %f", dltY);
    if (_orientation == SSSliderOrientationHorizontalLeft) {
        float newX = MAX(
                         0,
                         MIN(
                             _thumbImageView.frame.origin.x+dltX,
                             self.frame.size.width-_thumbImageView.image.size.width*IMG_SIZE)
                         );
        _thumbImageView.frame = CGRectMake(newX, _thumbImageView.frame.origin.y, _thumbImageView.frame.size.width, _thumbImageView.frame.size.height);
        _minimumTrackImageView.frame = CGRectMake(_minimumTrackImageView.frame.origin.x, _minimumTrackImageView.frame.origin.y, _thumbImageView.center.x - _minimumTrackImageView.frame.origin.x, _minimumTrackImageView.frame.size.height);
        _maximumTrackImageView.frame = CGRectMake(_thumbImageView.center.x, _maximumTrackImageView.frame.origin.y, _trackImageView.bounds.size.width - (_thumbImageView.center.x - _minimumTrackImageView.frame.origin.x),_maximumTrackImageView.frame.size.height);
    } else if (_orientation == SSSliderOrientationHorizontalRight) {
        float newX = MAX(
						 0,
						 MIN(
							 _thumbImageView.frame.origin.x+dltX,
							 self.frame.size.width-self.frame.size.height)
						 );
        _thumbImageView.frame = CGRectMake(newX, _thumbImageView.frame.origin.y, _thumbImageView.frame.size.width, _thumbImageView.frame.size.height);
    } else if (_orientation == SSSliderOrientationVerticalBottom) {
        float newY = MAX(
                         0,
                         MIN(
                             _thumbImageView.frame.origin.y+dltY,
                             self.frame.size.height - _thumbImageView.image.size.height*IMG_SIZE)
                         );
        _thumbImageView.frame = CGRectMake(_thumbImageView.frame.origin.x, newY, _thumbImageView.frame.size.width, _thumbImageView.frame.size.height);
        _minimumTrackImageView.frame = CGRectMake(_minimumTrackImageView.frame.origin.x, _thumbImageView.center.y, _minimumTrackImageView.frame.size.width, self.bounds.size.height-_thumbImageView.image.size.height*IMG_SIZE/2 - _thumbImageView.center.y);
        _maximumTrackImageView.frame = CGRectMake(_maximumTrackImageView.frame.origin.x, _maximumTrackImageView.frame.origin.y, _maximumTrackImageView.frame.size.width, _thumbImageView.center.y - _thumbImageView.image.size.height*IMG_SIZE/2);
    }
    
    [self calculateCurrentValue];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
}


@end
