//
//  CustomSegmentedControl.m
//  CustomSegmentedControlOC
//
//  Created by Jasmine on 2018/9/14.
//  Copyright © 2018年 Leela Prasad. All rights reserved.
//

#import "CustomSegmentedControl.h"

IB_DESIGNABLE
@interface CustomSegmentedControl()
@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation CustomSegmentedControl

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self updateView];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupValues];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupValues];
        [self updateView];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(BUTTONSTYLE)style {
    self = [self initWithFrame:frame];
    _btStyle = style;
    return self;
}

- (void)setupValues {
    _buttons = @[].mutableCopy;
    _selectedSegmentIndex = 0;
    _borderWidth = 0;
    _cornerRadius = 0;
    _borderColor = UIColor.clearColor;
    _commaSeperatedButtonTitles = @"";
    _textColor = UIColor.lightGrayColor;
    _fontSize  = 15;
    _selectorColor = UIColor.darkGrayColor;
    _selectorTextColor = UIColor.greenColor;
    _btStyle = BUTTONSTYLE_FONTWITHUNDERLINE;
}

- (void)updateView {
    [_buttons removeAllObjects];
    for (UIView *one in self.subviews) {
        [one removeFromSuperview];
    }
    
    NSArray *buttonTitles = [_commaSeperatedButtonTitles componentsSeparatedByString:@","];
    for (NSString *title in buttonTitles) {
        UIButton *bt = [self configButtons];
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:_textColor forState:UIControlStateNormal];
        [bt addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [_buttons addObject:bt];
    }
    
    [_buttons[0] setTitleColor:_selectorTextColor forState:UIControlStateNormal];
    CGFloat selectorWidth = self.frame.size.width / _buttons.count;
    CGFloat y = CGRectGetMaxY(self.frame) - CGRectGetMinY(self.frame) - 3.0;
    _selector = [[UIView alloc] initWithFrame:CGRectMake(0, y, selectorWidth, 3.0)];
    _selector.backgroundColor = _selectorColor;
    [self addSubview:_selector];
    
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:_buttons];
    _stackView.axis = UILayoutConstraintAxisHorizontal;
    _stackView.alignment = UIStackViewAlignmentFill;
    _stackView.distribution = UIStackViewDistributionFillEqually;
    
    CGFloat spacing = 0;
    if (_btStyle == BUTTONSTYLE_ELLIPSE) {
        spacing = 30;
        _selector.hidden = true;
        UIButton *btFirst = _buttons[0];
        btFirst.backgroundColor = _selectorColor;
        btFirst.layer.borderWidth = 0;
    }
    
    _stackView.spacing = spacing;
    [self addSubview:_stackView];
    
    _stackView.translatesAutoresizingMaskIntoConstraints = false;
    
    [[_stackView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:true];
    [[_stackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:true];
    [[_stackView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:true];
    [[_stackView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:true];
}

- (void)buttonTapped:(UIButton *)button {
    NSInteger buttonIndex = 0;
    for (UIButton *btn in _buttons) {
        [btn setTitleColor:_textColor forState:UIControlStateNormal];
        
        btn.backgroundColor = [UIColor clearColor];
        btn.layer.borderWidth = _borderWidth;
        if (btn == button) {
            _selectedSegmentIndex = buttonIndex;
            CGFloat selectorStartPosition = (self.frame.size.width / _buttons.count) * buttonIndex ;
            [UIView animateWithDuration:0.3 animations:^{
                CGRect frame = self.selector.frame;
                frame.origin.x = selectorStartPosition;
                self.selector.frame = frame;
            }];
            [btn setTitleColor:_selectorTextColor forState:UIControlStateNormal];
            if (_btStyle == BUTTONSTYLE_ELLIPSE) {
                btn.backgroundColor = _selectorColor;
                btn.layer.borderWidth = 0;
            }
        }
        buttonIndex++;
    }
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (UIButton *)configButtons {
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeSystem];
    switch (_btStyle) {
        case BUTTONSTYLE_FONTWITHUNDERLINE:
            break;
        case BUTTONSTYLE_ELLIPSE:
            _borderWidth = 1.0;
            bt = [UIButton buttonWithType:UIButtonTypeCustom];
            bt.titleLabel.font = [UIFont systemFontOfSize:_fontSize];
            bt.layer.cornerRadius = 10;
            bt.layer.borderWidth = _borderWidth;
            bt.layer.borderColor = _textColor.CGColor;
            break;
            
        default:
            break;
    }
    
    return bt;
}

- (void)updateSegmentedControlSegs:(NSInteger)index {
    
    for (UIButton *btn in _buttons ){
        [btn setTitleColor:_textColor forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
    }
    
    CGFloat  selectorStartPosition = (self.frame.size.width / _buttons.count) * index;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.selector.frame;
        frame.origin.x = selectorStartPosition;
        self.selector.frame = frame;
    } ];
    
    UIButton *bt = (UIButton *)_buttons[index];
    [bt setTitleColor:_selectorTextColor forState:UIControlStateNormal ];
    
    
}

#pragma mark - setter
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBtStyle:(BUTTONSTYLE)btStyle {
    _btStyle = btStyle;
    [self updateView];
}

- (void)setCommaSeperatedButtonTitles:(NSString *)commaSeperatedButtonTitles {
    _commaSeperatedButtonTitles = commaSeperatedButtonTitles;
    [self updateView];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self updateView];
}

- (void)setSelectorColor:(UIColor *)selectorColor {
    _selectorColor = selectorColor;
    [self updateView];
}

- (void)setSelectorTextColor:(UIColor *)selectorTextColor {
    _selectorTextColor = selectorTextColor;
    [self updateView];
}

@end
