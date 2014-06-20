//
//  VCInputTextView.m
//  VCAnimationKeyboard
//
//  Created by Vincent Chow on 20/6/14.
//  Copyright (c) 2014年 Vincent Chow. All rights reserved.
//

#import "VCInputTextView.h"

@implementation VCInputTextView

@synthesize inputView,sendReplyButton,isKeybosrdShow;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Add input view
        
        inputView = [[UITextField alloc]initWithFrame:CGRectMake(30, 7, 200, 30)];
        [inputView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:inputView];
        
        // Add send button
        
        sendReplyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        sendReplyButton.backgroundColor = [UIColor blueColor];
        sendReplyButton.frame = CGRectMake(250, 7, 60, 30);
        [sendReplyButton setTitle:@"send" forState:UIControlStateNormal];
        sendReplyButton.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:sendReplyButton];
        
        // Customize self appearance, do anything you want
        
        [self setBackgroundColor:[UIColor grayColor]];
        
        // Add observers,remember both show & hide needs to be set up
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeKeyboardViewShowPoint:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeKeyboardViewHidePoint:) name:UIKeyboardWillHideNotification object:nil];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark - Notification Methods -

- (void)changeKeyboardViewShowPoint:(NSNotification *)notification
{
    isKeybosrdShow = YES;   // Set the show-status
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;     // Get the origin.y value of the keyboard when it shows,notice that when keyboard's type changes,the origin.y will change accordingly.

    
    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Set up show-animation
    [UIView animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        
        self.center = CGPointMake(self.center.x, keyBoardEndY  - self.bounds.size.height/2.0);
    }];
}

- (void)changeKeyboardViewHidePoint:(NSNotification *)notification
{
    isKeybosrdShow = NO; // Set the hide-status
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardHeight = value.CGRectValue.size.height;  // Get the height of the keyboard,notice that when keyboard's type changes,the height will change accordingly.
    
    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Set up hide-animation
    [UIView animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];
        
        self.center = CGPointMake(self.center.x, self.center.y+keyBoardHeight);
        
    }];
}


@end
