//
//  ViewController.m
//  JSPatch_PR392
//
//  Created by chenjun on 6/2/16.
//  Copyright © 2016 chenjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *invokeButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.invokeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.invokeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.invokeButton setTitle:@"调用forwardInvocation" forState:(UIControlStateNormal)];
    [self.invokeButton addTarget:self action:@selector(invokeButtonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.invokeButton];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.invokeButton
                                  attribute:(NSLayoutAttributeCenterX)
                                  relatedBy:(NSLayoutRelationEqual)
                                     toItem:self.view
                                  attribute:(NSLayoutAttributeCenterX)
                                 multiplier:1
                                   constant:0]];
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.invokeButton
                                  attribute:(NSLayoutAttributeCenterY)
                                  relatedBy:(NSLayoutRelationEqual)
                                     toItem:self.view
                                  attribute:(NSLayoutAttributeCenterY)
                                 multiplier:1
                                   constant:0]];
    
    Method method = class_getInstanceMethod([self class], @selector(stubMethod));
    class_replaceMethod([self class], @selector(stubMethod), _objc_msgForward, (char *)method_getTypeEncoding(method));
}

- (void)invokeButtonPressed:(id)sender
{
    [self stubMethod];
}

- (void)stubMethod
{
    
}


- (void)handleBtn:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
