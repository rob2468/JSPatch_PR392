//
//  GrandSuperViewController.m
//  JSPatch_PR392
//
//  Created by chenjun on 6/2/16.
//  Copyright © 2016 chenjun. All rights reserved.
//

#import "GrandSuperViewController.h"

@interface GrandSuperViewController ()

@property (strong, nonatomic) UIButton *changeButton;

@end

@implementation GrandSuperViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.changeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.changeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.changeButton setTitle:@"修改父类的forwardInvocation" forState:(UIControlStateNormal)];
    [self.changeButton addTarget:self action:@selector(changeButtonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.changeButton];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.changeButton
                                  attribute:(NSLayoutAttributeCenterX)
                                  relatedBy:(NSLayoutRelationEqual)
                                     toItem:self.view
                                  attribute:(NSLayoutAttributeCenterX)
                                 multiplier:1
                                   constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.changeButton
                                  attribute:(NSLayoutAttributeCenterY)
                                  relatedBy:(NSLayoutRelationEqual)
                                     toItem:self.view
                                  attribute:(NSLayoutAttributeCenterY)
                                 multiplier:1
                                   constant:-50]];
}

- (void)changeButtonPressed:(id)sender
{
    if (class_getMethodImplementation([GrandSuperViewController class], @selector(forwardInvocation:)) != (IMP)ForwardInvocation0)
    {
        class_replaceMethod([GrandSuperViewController class], @selector(forwardInvocation:), (IMP)ForwardInvocation0, "v@:@");
    }
    else
    {
        class_replaceMethod([GrandSuperViewController class], @selector(forwardInvocation:), (IMP)ForwardInvocation1, "v@:@");
    }
}

static void ForwardInvocation0(__unsafe_unretained id assignSlf, SEL selector, NSInvocation *invocation)
{
    NSLog(@"working0");
}

static void ForwardInvocation1(__unsafe_unretained id assignSlf, SEL selector, NSInvocation *invocation)
{
    NSLog(@"working1");
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"working origin");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
