//
//  CustomSegmentedControl.h
//  CustomSegmentedControlOC
//
//  Created by Jasmine on 2018/9/14.
//  Copyright © 2018年 Leela Prasad. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    BUTTONSTYLE_FONTWITHUNDERLINE=0,
    BUTTONSTYLE_ELLIPSE=1
} BUTTONSTYLE;

@interface CustomSegmentedControl : UIControl
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIView *selector;
@property (nonatomic, assign) NSInteger selectedSegmentIndex;

#if TARGET_INTERFACE_BUILDER
@property (nonatomic, assign) IBInspectable NSInteger btStyle;
#else
@property (nonatomic)  BUTTONSTYLE btStyle;
#endif


@property (nonatomic, assign) IBInspectable CGFloat fontSize;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, strong) IBInspectable UIColor *textColor;
@property (nonatomic, strong) IBInspectable UIColor *selectorColor;
@property (nonatomic, strong) IBInspectable UIColor *selectorTextColor;
@property (nonatomic, strong) IBInspectable NSString *commaSeperatedButtonTitles;

- (id)initWithFrame:(CGRect)frame style:(BUTTONSTYLE)style ;
@end
