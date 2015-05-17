//
//  VectorObjectView.h
//  Vector Addition
//
//  Created by David Paquette on 6/3/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "VectorClass.h"

@interface VectorObjectView : UIViewController <UITextFieldDelegate>
{
    IBOutlet UISegmentedControl *defineVectorBar;
    AppDelegate *appDelegate;
    int detailItem;
    NSString* demMode;
    
}
@property (weak, nonatomic) IBOutlet UILabel *angleValueLabel;
-(void)setDetailItem:(int)newDetailItem;
- (IBAction)defineVectorBar:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UITextField *vectorXfield;
@property (weak, nonatomic) IBOutlet UITextField *vectorYfield;
@property (weak, nonatomic) IBOutlet UITextField *magField;
@property (weak, nonatomic) IBOutlet UITextField *angleField;
@property (weak, nonatomic) IBOutlet UITextField *pointOneXfield;
@property (weak, nonatomic) IBOutlet UITextField *pointOneYfield;
@property (weak, nonatomic) IBOutlet UITextField *pointTwoXfield;
@property (weak, nonatomic) IBOutlet UITextField *pointTwoYfield;
@property (weak, nonatomic) IBOutlet UITextField *pointOneZfield;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *pointTwoZfield;
@property (weak, nonatomic) IBOutlet UILabel *vectorNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *vectorZfield;

@end
