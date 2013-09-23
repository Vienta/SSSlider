//
//  ViewController.m
//  SSSlider
//
//  Created by 束 永兴 on 13-9-16.
//  Copyright (c) 2013年 Candy. All rights reserved.
//

#import "ViewController.h"
#import "SSSlider.h"

@interface ViewController ()
{
    UILabel *lbl;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    SSSlider *slider = [[SSSlider alloc] initWithFrame:CGRectMake(10, 200, 30, 300)];
    SSSlider *slider = [[SSSlider alloc] initVerticalWithFrame:CGRectMake(100, 200, 30, 300)];
//    slider.backgroundColor = [UIColor greenColor];
    slider.value = .6;
    slider.minimumTrackTintColor = [UIColor greenColor];
    slider.maximumTrackTintColor = [UIColor redColor];
    slider.orientation = SSSliderOrientationVerticalBottom;
//    slider.orientation = SSSliderOrientationHorizontalLeft;
//    slider.thumbImage = [UIImage imageFilename:@"slider_allin_thumb"];
//    slider.backgroundColor = [UIColor greenColor];
    [slider addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.center = CGPointMake(self.view.bounds.size.width/2, 100);
    lbl.text = [NSString stringWithFormat:@"%f", slider.value];
    lbl.backgroundColor = [UIColor yellowColor];
    lbl.font = [UIFont systemFontOfSize:16];
    lbl.textColor = [UIColor redColor];
    [self.view addSubview:lbl];
}
- (void)test:(id)sender
{
    SSSlider *slider = (id)sender;
    NSLog(@"sender = %f", slider.value);
    lbl.text = [NSString stringWithFormat:@"%f", slider.value];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
