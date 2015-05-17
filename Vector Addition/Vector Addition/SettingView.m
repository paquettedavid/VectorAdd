//
//  SettingView.m
//  Vector Addition
//
//  Created by David Paquette on 6/5/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "SettingView.h"

@interface SettingView ()

@end

@implementation SettingView


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if([self.getDimensionUserSettings isEqual:@"0"]){
        _dimensionSelect.selectedSegmentIndex = 0;
        endSaveMe = @"2D";
        saveMe = @"2D";
    }
    else if([self.getDimensionUserSettings isEqual:@"1"]){
        _dimensionSelect.selectedSegmentIndex = 1;
        endSaveMe = @"3D";
        saveMe = @"3D";
    }
    
    if([self.getAngleUserSettings isEqual:@"0"]){
        _angleSelect.selectedSegmentIndex = 0;
    }
    else if([self.getAngleUserSettings isEqual:@"1"]){
        _angleSelect.selectedSegmentIndex = 1;
    }
  

    
  
  
}
-(void)viewWillDisappear:(BOOL)animated{
    if (saveMe == endSaveMe) {
        
    }
    else{
        [appDelegate.vectorObjects removeAllObjects];
        appDelegate.indexCell = 0;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)dimensionSelectChange:(UISegmentedControl *)sender {
    
    
    
    switch (_dimensionSelect.selectedSegmentIndex) {
        case 0:
            [self saveDimensionMode:0];
           
            saveMe = @"2D";
            break;
        case 1:
            [self saveDimensionMode:1];
           
            saveMe = @"3D";
            break;
            
        default:
            
            break;
    }
}

- (IBAction)angleModeChange:(UISegmentedControl *)sender {
    
    switch (_angleSelect.selectedSegmentIndex) {
        case 0:
            [self saveAngleMode:0];
            
            break;
        case 1:
            [self saveAngleMode:1];
            break;
            
        default:
            
            break;
    }
}

-(void)saveDimensionMode: (int) index{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserDimensionValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    if(index == 0){
    [[@"0" dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
    }
    else if(index == 1){
       [[@"1" dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO]; 
    }
    
}

-(void)saveAngleMode: (int) index{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserAngleValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
    if(index == 0){
        [[@"0" dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
        for(int index = 0; index < appDelegate.vectorObjects.count; index++){
            [[appDelegate.vectorObjects objectAtIndex:index] setAngleMode:false];
        }
    }
    else if(index == 1){
        [[@"1" dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
        for(int index = 0; index < appDelegate.vectorObjects.count; index++){
            [[appDelegate.vectorObjects objectAtIndex:index] setAngleMode:true];
        }
    }
    
    
    
}

-(NSString*)getDimensionUserSettings{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserDimensionValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
    NSString* content = [NSString stringWithContentsOfFile:fileAtPath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    return content;
}

- (IBAction)mailLink:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"mailto:vectoradd@gmail.com"]];
}

-(NSString*)getAngleUserSettings{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserAngleValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
    NSString* content = [NSString stringWithContentsOfFile:fileAtPath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    return content;
}


@end
