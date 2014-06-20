//
//  VCAnimationKeyboardDemoViewController.m
//  VCAnimationKeyboard
//
//  Created by Vincent Chow on 20/6/14.
//  Copyright (c) 2014年 Vincent Chow. All rights reserved.
//

#import "VCAnimationKeyboardDemoViewController.h"

#define UIViewHeight [[UIScreen mainScreen] bounds].size.height


@interface VCAnimationKeyboardDemoViewController ()

@end

@implementation VCAnimationKeyboardDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Add VCInputTextView
        
        self.inputRepleyView = [[VCInputTextView alloc]initWithFrame:CGRectMake(0,UIViewHeight-44, 320, 44)];
        [self.view addSubview:self.inputRepleyView];
        
        // Deal with the keyboard hidden
        
        self.view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturePressed:)];
        
        // If the tap gesture confilcts with any other gesture you have set before, use the gesture delegate methods to cope with it.
            //tapGesture.delegate = self;
        
        [self.view addGestureRecognizer:tapGesture];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Hide Keyboard Methods -

- (void)tapGesturePressed:(UITapGestureRecognizer *)tapGesture
{
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillHideNotification object:nil];
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark -UIGestureRecognizer Delegate Methods -

//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    if (self.inputRepleyView.isKeybosrdShow)      // show or hide according to keyboard status
//    {
//        return YES;
//    }
//    return NO;
//}


@end
