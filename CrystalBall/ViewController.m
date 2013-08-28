//
//  ViewController.m
//  CrystalBall
//
//  Created by Marc Maycas on 28/08/13.
//  Copyright (c) 2013 Marc Maycas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    //Button connected to our view controller and send a message to the log
    //NSLog(@"button pressed");
    
    //Set a new text on the predictionLabel
    self.predictionLabel.text = @"Definitely Yes";
    
}
@end
