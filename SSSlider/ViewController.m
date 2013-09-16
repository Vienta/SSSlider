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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SSSlider *slider = [[SSSlider alloc] initWithFrame:CGRectMake(200, 400, 300, 30)];
    slider.minimumValue = 20000;
    slider.maximumValue = 399999;
    slider.orientation = SSSliderOrientationHorizontalRight;
    
    slider.backgroundColor = [UIColor greenColor];
    [self.view addSubview:slider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
