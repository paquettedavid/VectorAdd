//
//  ViewController.h
//  Vector Addition
//
//  Created by David Paquette on 6/2/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//
 
#import <UIKit/UIKit.h>
#import "VectorListView.h"
#import "AppDelegate.h"
#import "VectorCalculatons.h"
#import "VectorClass.h"
#import "VectorMath.h"


@interface ViewController : UIViewController
{
    UIButton *dummyButton;
    AppDelegate *appDelegate;
    VectorCalculatons* resultVector;
    NSString* viewAngleMode;
    NSString* viewAngle;
    NSString *demMode;
    VectorMath *mathCalc;
    double angleView;

}
@property (weak, nonatomic) IBOutlet UINavigationBar *barTop;
@property (weak, nonatomic) IBOutlet UILabel *orthLabel;
@property (weak, nonatomic) IBOutlet UILabel *demLabel;
@property (weak, nonatomic) IBOutlet UILabel *angleStatus;
@property (weak, nonatomic) IBOutlet UILabel *angleThreeLabel;
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *magLabel;
@property (weak, nonatomic) IBOutlet UILabel *angleLabel;
@property (weak, nonatomic) IBOutlet UILabel *vectorLabel;
- (IBAction)dummyButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *paraLabel;
- (IBAction)editButton:(UIBarButtonItem *)sender;
- (IBAction)newCalculationButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *betweenAngleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dotLabel;
@property (weak, nonatomic) IBOutlet UILabel *crossSlabel;
@property (weak, nonatomic) IBOutlet UILabel *dotSlabel;
@property (weak, nonatomic) IBOutlet UILabel *angleSlabel;
-(void)calculateData;
@property (weak, nonatomic) IBOutlet UILabel *crossLabel;
@end
