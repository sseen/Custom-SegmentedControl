//
//  ViewController.m
//  CustomSegmentedControlOC
//
//  Created by Jasmine on 2018/9/14.
//  Copyright © 2018年 Leela Prasad. All rights reserved.
//

#import "ViewController.h"
#import "CustomSegmentedControl.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomSegmentedControl * segmentedControl = [[CustomSegmentedControl alloc] initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, 45)];
    //        segmentedControl
    
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.commaSeperatedButtonTitles = @"first, two, three";
    [segmentedControl addTarget:self action:@selector(onChangeOfSegment:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
    
    CustomSegmentedControl * segmentedControl2 = [[CustomSegmentedControl alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 22) style:BUTTONSTYLE_ELLIPSE];
    segmentedControl2.fontSize = 14;
    segmentedControl2.backgroundColor = [UIColor whiteColor];
    segmentedControl2.selectorColor = [UIColor colorWithRed:64/255.0 green:213/255.0 blue:236/255.0 alpha:1];
    segmentedControl2.textColor = segmentedControl2.selectorColor;
    segmentedControl2.selectorTextColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
    segmentedControl2.commaSeperatedButtonTitles = @"first, two, three, helo";
    [segmentedControl2 addTarget:self action:@selector(onChangeOfSegment:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl2];
    
}

- (void)onChangeOfSegment:(CustomSegmentedControl *)segment {
    NSLog(@"%d", segment.selectedSegmentIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
