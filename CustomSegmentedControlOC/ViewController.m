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
}

- (void)onChangeOfSegment:(CustomSegmentedControl *)segment {
    NSLog(@"%d", segment.selectedSegmentIndex);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
