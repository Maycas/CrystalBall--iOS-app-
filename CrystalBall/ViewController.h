//
//  ViewController.h
//  CrystalBall
//
//  Created by Marc Maycas on 28/08/13.
//  Copyright (c) 2013 Marc Maycas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) NSArray *predictionArray;
@property (strong, nonatomic) NSArray *colorMessage;
@property (strong, nonatomic) UIImageView *imageView;

// Button method
// - (IBAction)buttonPressed:(UIButton *)sender;

//Prediction method
- (void) makePrediction;

@end
