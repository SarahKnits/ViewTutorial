//
//  SGViewController.m
//  viewTutorial
//
//  Created by Sarah Gilkinson on 9/9/14.
//  Copyright (c) 2014 Sarah Gilkinson. All rights reserved.
//

#import "SGViewController.h"
#import "SGGrid.h"

@interface SGViewController () {
    UIView* _gridView;
    UIButton* _button;
}

@end

@implementation SGViewController

// This function is from Stack Overflow
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // create grid frame
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)*.1;
    CGFloat y = CGRectGetHeight(frame)*.1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.80;
    
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    // create grid view
    _gridView = [[SGGrid alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_gridView];
    
    // create button
    CGFloat buttonSize = size/5.0;
    CGRect buttonFrame = CGRectMake(0, 0, buttonSize, buttonSize);
    _button = [[UIButton alloc] initWithFrame:buttonFrame];
    _button.backgroundColor= [UIColor redColor];
    [_gridView addSubview:_button];
    
    // create target for button
    [_button addTarget:self action:@selector(buttonPressed:)forControlEvents:UIControlEventTouchUpInside];
    [_button setTitle:@"Hit me!" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont systemFontOfSize: 12];
    [_button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    // From stack overflow
    [_button setBackgroundImage:[self imageWithColor:[UIColor yellowColor]] forState:UIControlStateHighlighted];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonPressed: (id)sender
{
    NSLog(@"You touched the button!");
}

-(void)buttonHighlight:(id)sender{
    _button.backgroundColor = [UIColor yellowColor];
    NSLog(@"Highlight!");
}



@end
