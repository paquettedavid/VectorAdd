//
//  SettingView.h
//  Vector Addition
//
//  Created by David Paquette on 6/5/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "VectorClass.h"

@interface SettingView : UIViewController{
    AppDelegate *appDelegate;
    NSString *saveMe;
    NSString *endSaveMe;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *dimensionSelect;
@property (weak, nonatomic) IBOutlet UISegmentedControl *angleSelect;
- (IBAction)dimensionSelectChange:(UISegmentedControl *)sender;
- (IBAction)angleModeChange:(UISegmentedControl *)sender;
-(void)saveDimensionMode: (int) index;
-(void)saveAngleMode: (int) index;
-(NSString*)getDimensionUserSettings;
- (IBAction)mailLink:(UIButton *)sender;

-(NSString*)getAngleUserSettings;
@end
