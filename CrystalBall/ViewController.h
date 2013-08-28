//
//  ViewController.h
//  CrystalBall
//
//  Created by Marc Maycas on 28/08/13.
//  Copyright (c) 2013 Marc Maycas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)buttonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;

@end
