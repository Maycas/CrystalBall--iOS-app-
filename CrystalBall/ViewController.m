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
                            @"It is decidedly so",
                            @"All signs say YES",
                            @"The stars are not aligned",
                            @"My reply is no",
                            @"It is doubtful",
                            @"Better not tell you now",
                            @"Concentrate and ask again",
                            @"Change your mind",
                            @"Better don't wake up today",
                            @"You'll find true love",
                            @"Unable to answer now", nil];
    
    //UIColor Array
    self.colorMessage =[[NSArray alloc] initWithObjects: [UIColor cyanColor],
                          [UIColor purpleColor],
                          [UIColor redColor],
                          [UIColor blueColor],
                          [UIColor greenColor],
                          [UIColor whiteColor],
                          [UIColor orangeColor],
                          [UIColor magentaColor],
                          [UIColor yellowColor], nil];
    
    /*
    //Adding the button programmatically
    UIImage *buttonOff = [UIImage imageNamed:@"buttonBackground.png"];
    
    UIButton *predictButton = [UIButton buttonWithType:UIButtonTypeCustom];
    predictButton.frame = CGRectMake(80.0, 380.0, 160.0, 80.0);
    [predictButton setBackgroundImage:buttonOff forState:UIControlStateNormal];
    [predictButton setTitle:@"Predict" forState:UIControlStateNormal];
    [predictButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [predictButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:predictButton];
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (IBAction)buttonPressed:(UIButton *)sender {
    //Button connected to our view controller and send a message to the log
    //NSLog(@"button pressed");
    
    String training
    //Creating a string literal
    NSString *myString = @"myNameisMarc";
    [myString length];
    [myString uppercaseString];
 
    
 
    //Set a new text on the predictionLabel
    self.predictionLabel.text = @"Definitely Yes";
 
    
    //Access randomly to the array
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
    
    //Change color randomly
    NSUInteger colorIndex = arc4random_uniform(self.colorMessage.count);
    self.predictionLabel.textColor = [self.colorMessage objectAtIndex:colorIndex];
    
} 
*/

- (void) makePrediction {
    //Access randomly to the array
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
    
    //Change color randomly
    NSUInteger colorIndex = arc4random_uniform(self.colorMessage.count);
    self.predictionLabel.textColor = [self.colorMessage objectAtIndex:colorIndex];
}

- (BOOL) canBecomeFirstResponder{
    return YES;
}

- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    //Clear out prediction label when shaking
    self.predictionLabel.text =@"";
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake){
        //When motion ends, display a prediction
        [self makePrediction];
    }
}

- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion Cancelled");
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = @"";
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //When motion ends, display a prediction
    [self makePrediction];
}

@end
