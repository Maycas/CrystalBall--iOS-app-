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

@synthesize predictionLabel;
@synthesize predictionArray;
@synthesize colorMessage;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Creating the background image
    UIImage *image = [UIImage imageNamed:@"background.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:imageView atIndex:0];
    
    //Create the predictionArray only once
    self.predictionArray = [[NSArray alloc] initWithObjects:@"It is certain",
                            @"It is decidedly so",@"All signs say YES",
                            @"The stars are not aligned",
                            @"My reply is no",
                            @"It is doubtful",
                            @"Better not tell you now",
                            @"Concentrate and ask again",
                            @"Change your mind",
                            @"Unable to answer now", nil];
    
    //UIColor Array
    self.colorMessage =[[NSArray alloc] initWithObjects: [UIColor cyanColor],
                          [UIColor purpleColor],
                          [UIColor redColor],
                          [UIColor blueColor],
                          [UIColor yellowColor], nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    //Button connected to our view controller and send a message to the log
    //NSLog(@"button pressed");
    
    /*String training
    //Creating a string literal
    NSString *myString = @"myNameisMarc";
    [myString length];
    [myString uppercaseString];
    */
    
    /*
    //Set a new text on the predictionLabel
    self.predictionLabel.text = @"Definitely Yes";
    */
    
    //Access randomly to the array
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
    
    //Change color randomly
    NSUInteger colorIndex = arc4random_uniform(self.colorMessage.count);
    self.predictionLabel.textColor = [self.colorMessage objectAtIndex:colorIndex];
    
}
@end
