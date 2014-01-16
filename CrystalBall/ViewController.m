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
@synthesize imageView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //Creating an animated background image
    UIImage *image = [UIImage imageNamed:@"background.png"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:self.imageView atIndex:0];
    
    self.imageView.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"cball00001"],
                                      [UIImage imageNamed:@"cball00002"],
                                      [UIImage imageNamed:@"cball00004"],
                                      [UIImage imageNamed:@"cball00004"],
                                      [UIImage imageNamed:@"cball00005"],
                                      [UIImage imageNamed:@"cball00006"],
                                      [UIImage imageNamed:@"cball00007"],
                                      [UIImage imageNamed:@"cball00008"],
                                      [UIImage imageNamed:@"cball00009"],
                                      [UIImage imageNamed:@"cball00010"],
                                      [UIImage imageNamed:@"cball00011"],
                                      [UIImage imageNamed:@"cball00012"],
                                      [UIImage imageNamed:@"cball00013"],
                                      [UIImage imageNamed:@"cball00014"],
                                      [UIImage imageNamed:@"cball00015"],
                                      [UIImage imageNamed:@"cball00016"],
                                      [UIImage imageNamed:@"cball00017"],
                                      [UIImage imageNamed:@"cball00018"],
                                      [UIImage imageNamed:@"cball00019"],
                                      [UIImage imageNamed:@"cball00020"],
                                      [UIImage imageNamed:@"cball00021"],
                                      [UIImage imageNamed:@"cball00022"],
                                      [UIImage imageNamed:@"cball00023"],
                                      [UIImage imageNamed:@"cball00024"], nil];
    self.imageView.animationDuration = 1.0;
    self.imageView.animationRepeatCount = 1;
    
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
                            @"Unable to answer now",
                            @"Marcos has told me to say: hi!", nil];
    
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
    
    //Start animating ball and text
    [self.imageView startAnimating];
    
    [UIView animateWithDuration:2.0 animations:^{
        self.predictionLabel.alpha = 1.0;
    }];
    
    //Animate label movement
    self.predictionLabel.frame = CGRectMake(40, 260, 239, 96); // move label to lowest part of ball
    [UIView animateWithDuration:1.0 animations:^{
        self.predictionLabel.frame = CGRectMake(40, 196, 239, 96); // animate it upwards
    }];
}


- (BOOL) canBecomeFirstResponder{
    return YES;
}


- (void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    //Set alpha to 0 for animation
    self.predictionLabel.alpha = 0.0;
    
    if (motion == UIEventSubtypeMotionShake){
        //Clear out prediction label when shaking
        self.predictionLabel.text =nil;
        
        [UIView animateWithDuration:1.0 animations:^{
            self.predictionLabel.frame = CGRectMake(20, 260, 239, 96); // animate it downwards
        }];
    }
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if ( motion == UIEventSubtypeMotionShake ){
        [UIView animateWithDuration:0.5 animations:^{
            self.predictionLabel.frame = CGRectMake(40, 196, 239, 96); // animate it upwards
        } completion:^(BOOL finished) {
            [self makePrediction];
        }];
    }
}


- (void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion Cancelled");
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //Clear out prediction label when touching
    self.predictionLabel.text = nil;
    //Set alpha to 0 for animation
    self.predictionLabel.alpha = 0.0;
}


- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //When motion ends, display a prediction
    [self makePrediction];
}

@end
