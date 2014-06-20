//
//  VCInputTextView.h
//  VCAnimationKeyboard
//
//  Created by Vincent Chow on 20/6/14.
//  Copyright (c) 2014年 Vincent Chow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCInputTextView : UIView

@property(nonatomic,retain) UITextField *inputView;         //  input-textField
@property(nonatomic,retain) UIButton *sendReplyButton;      //  send button
@property(nonatomic,assign) BOOL isKeybosrdShow;            //  the status of keyboard  YES: show NO: hide

@end
