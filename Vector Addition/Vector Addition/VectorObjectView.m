//
//  VectorObjectView.m
//  Vector Addition
//
//  Created by David Paquette on 6/3/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "VectorObjectView.h"

@interface VectorObjectView ()
- (void)configureView;
@end

@implementation VectorObjectView

#pragma mark - Managing the detail item

- (void)setDetailItem:(int)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;

    }
}



- (void)configureView
{
    switch ([[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] originalDataSource]) {
        case 0:
            [self setBoxSettings:0];
            
            break;
        case 1:
            [self setBoxSettings:1];
            break;
            
        case 2:
            [self setBoxSettings:2];
            break;
            
        default:
            break;
    }
    
   

    

     NSString *combined = [NSString stringWithFormat:@"%@%@", @"Define ", [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] description]];
     combined = [NSString stringWithFormat:@"%@%@", combined, @" with:"];
    
    _vectorNameLabel.text = combined;
    

}
-(void)viewDidDisappear:(BOOL)animated
{
   
    }

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString* filePathD = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameD = @"UserDimensionValue.txt";
    NSString* fileAtPathD = [filePathD stringByAppendingPathComponent:fileNameD];
    
    
    
    demMode = [NSString stringWithContentsOfFile:fileAtPathD
                                        encoding:NSUTF8StringEncoding
                                           error:NULL];
    
    
    
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserAngleValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
    NSString *viewAngleMode = [NSString stringWithContentsOfFile:fileAtPath
                                              encoding:NSUTF8StringEncoding
                                                 error:NULL];
    if([viewAngleMode isEqual:@"1"]){
        _angleValueLabel.text = @"";
    }
    else{
        _angleValueLabel.text = @"°";
    }

	// Do any additional setup after loading the view, typically from a nib.
    _magField.delegate = self;
    _angleField.delegate = self;
    _vectorYfield.delegate = self;
    _vectorXfield.delegate = self;
    _vectorZfield.delegate = self;
    
    _pointOneXfield.delegate= self;
    _pointOneYfield.delegate = self;
    _pointTwoXfield.delegate = self;
    _pointTwoYfield.delegate = self;
    _pointOneZfield.delegate = self;
    _pointTwoZfield.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [self configureView];
    [self loadDataFromObjects];

}
-(void)viewWillDisappear:(BOOL)animated{
    switch (defineVectorBar.selectedSegmentIndex) {
        case 0:
            if([demMode isEqual:@"1"]){
                
                [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setVectorParts:[_vectorXfield.text doubleValue] :[_vectorYfield.text doubleValue] :[_vectorZfield.text doubleValue]];
                
                [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setSourceData:defineVectorBar.selectedSegmentIndex];
                
                
            }
            
            else{
                [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setAngleAndMag:[_angleField.text doubleValue] :[_magField.text doubleValue]];
                [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setSourceData:defineVectorBar.selectedSegmentIndex];
                [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] calculateVectorPartsUsingAngleAndMag];
            }
           
            break;
        case 1:
             if([demMode isEqual:@"1"]){
                 [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setVectorPoints:[_pointOneXfield.text doubleValue] :[_pointOneYfield.text doubleValue] :[_pointTwoXfield.text doubleValue] :[_pointTwoYfield.text doubleValue] : [_pointOneZfield.text doubleValue] : [_pointTwoZfield.text doubleValue]];
                 [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setSourceData:defineVectorBar.selectedSegmentIndex];
                 [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] calculateVectorPartsUsingPoints];
             }
             else{
                 [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setVectorParts:[_vectorXfield.text doubleValue] :[_vectorYfield.text doubleValue]];
                 [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setSourceData:defineVectorBar.selectedSegmentIndex];
             }
           
             
            
            break;
            
        case 2:
            [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setVectorPoints:[_pointOneXfield.text doubleValue] :[_pointOneYfield.text doubleValue] :[_pointTwoXfield.text doubleValue] :[_pointTwoYfield.text doubleValue]];
            [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] setSourceData:defineVectorBar.selectedSegmentIndex];
            [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] calculateVectorPartsUsingPoints];
            
            break;
            
        default:
            
            break;
            
            
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)defineVectorBar:(UISegmentedControl *)sender {
    
    switch (defineVectorBar.selectedSegmentIndex) {
        case 0:
            [self setBoxSettings:0];
            
            break;
        case 1:
            [self setBoxSettings:1];
            break;
            
        case 2:
            [self setBoxSettings:2];
            break;
            
        default:
          
            break;
    }
    _pointOneXfield.text = @"";
    _pointOneYfield.text = @"";
    _pointTwoXfield.text = @"";
    _pointTwoYfield.text = @"";
    _pointOneZfield.text = @"";
    _pointTwoZfield.text = @"";
    
    _vectorXfield.text = @"";
    _vectorYfield.text = @"";
    _vectorZfield.text = @"";
    
    _magField.text = @"";
    _angleField.text = @"";
}


-(void)dismissKeyboard {
    
    [_angleField resignFirstResponder];
    [_magField resignFirstResponder];
    
    [_vectorXfield resignFirstResponder];
    [_vectorYfield resignFirstResponder];
    [_vectorZfield resignFirstResponder];
    
    [_pointOneXfield resignFirstResponder];
    [_pointOneYfield resignFirstResponder];
    [_pointTwoXfield resignFirstResponder];
    [_pointTwoYfield resignFirstResponder];
    [_pointOneZfield resignFirstResponder];
    [_pointTwoZfield resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [_angleField resignFirstResponder];
    [_magField resignFirstResponder];
    
    [_vectorXfield resignFirstResponder];
    [_vectorYfield resignFirstResponder];
    [_vectorZfield resignFirstResponder];
    
    [_pointOneXfield resignFirstResponder];
    [_pointOneYfield resignFirstResponder];
    [_pointTwoXfield resignFirstResponder];
    [_pointTwoYfield resignFirstResponder];
    [_pointOneZfield resignFirstResponder];
    [_pointTwoZfield resignFirstResponder];
    
	return YES;
    
}

-(void)setBoxSettings:(int)index {
    
    switch (index) {
        case 0:
            if([demMode isEqual:@"1"]){
                
                _vectorXfield.enabled = true;
                _vectorYfield.enabled = true;
                _vectorZfield.enabled = true;
                _vectorXfield.alpha = 1;
                _vectorYfield.alpha = 1;
                _vectorZfield.alpha = 1;
                
                _pointOneXfield.enabled = false;
                _pointOneYfield.enabled = false;
                _pointTwoXfield.enabled = false;
                _pointTwoYfield.enabled = false;
                _pointOneZfield.enabled = false;
                _pointTwoZfield.enabled = false;
                _pointOneXfield.alpha = .1;
                _pointOneYfield.alpha = .1;
                _pointTwoXfield.alpha = .1;
                _pointTwoYfield.alpha = .1;
                _pointOneZfield.alpha = .1;
                _pointTwoZfield.alpha = .1;

                
            }
            else{
            _angleField.enabled = true;
            _magField.enabled = true;
            _angleField.alpha = 1;
            _magField.alpha = 1;
            
            _vectorXfield.enabled = false;
            _vectorYfield.enabled = false;
            _vectorXfield.alpha = .1;
            _vectorYfield.alpha = .1;
            
            _pointOneXfield.enabled = false;
            _pointOneYfield.enabled = false;
            _pointTwoXfield.enabled = false;
            _pointTwoYfield.enabled = false;
            _pointOneXfield.alpha = .1;
            _pointOneYfield.alpha = .1;
            _pointTwoXfield.alpha = .1;
            _pointTwoYfield.alpha = .1;
            }
            

            
            break;
        case 1:
            if([demMode isEqual:@"1"]){
                
                _vectorXfield.enabled = false;
                _vectorYfield.enabled = false;
                _vectorZfield.enabled = false;
                _vectorXfield.alpha = .1;
                _vectorYfield.alpha = .1;
                _vectorZfield.alpha = .1;
                
                _pointOneXfield.enabled = true;
                _pointOneYfield.enabled = true;
                _pointTwoXfield.enabled = true;
                _pointTwoYfield.enabled = true;
                _pointOneZfield.enabled = true;
                _pointTwoZfield.enabled = true;
                
                _pointOneXfield.alpha = 1;
                _pointOneYfield.alpha = 1;
                _pointTwoXfield.alpha = 1;
                _pointTwoYfield.alpha = 1;
                _pointOneZfield.alpha = 1;
                _pointTwoZfield.alpha = 1;
            }
            else{
            _angleField.enabled = false;
            _magField.enabled = false;
            _angleField.alpha = .1;
            _magField.alpha = .1;
            
            _vectorXfield.enabled = true;
            _vectorYfield.enabled = true;
            _vectorXfield.alpha = 1;
            _vectorYfield.alpha = 1;
            
            _pointOneXfield.enabled = false;
            _pointOneYfield.enabled = false;
            _pointTwoXfield.enabled = false;
            _pointTwoYfield.enabled = false;
            _pointOneXfield.alpha = .1;
            _pointOneYfield.alpha = .1;
            _pointTwoXfield.alpha = .1;
            _pointTwoYfield.alpha = .1;
            }
            break;
            
        case 2:
            _angleField.enabled = false;
            _magField.enabled = false;
            _angleField.alpha = .1;
            _magField.alpha = .1;
            
            _vectorXfield.enabled = false;
            _vectorYfield.enabled = false;
            _vectorXfield.alpha = .1;
            _vectorYfield.alpha = .1;
            
            _pointOneXfield.enabled = true;
            _pointOneYfield.enabled = true;
            _pointTwoXfield.enabled = true;
            _pointTwoYfield.enabled = true;
            
            _pointOneXfield.alpha = 1;
            _pointOneYfield.alpha = 1;
            _pointTwoXfield.alpha = 1;
            _pointTwoYfield.alpha = 1;
            
            break;
            
        default:
            break;

}
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, 140);
    [_scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [_scrollView setContentOffset:CGPointZero animated:YES];
}


-(void) loadDataFromObjects
{
    int source = [[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] originalDataSource];
    if(!([[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getNew])){
    switch (source) {
        case 0:
            if([demMode isEqual:@"1"]){
                if(_vectorXfield.isEnabled){
                    [defineVectorBar setSelectedSegmentIndex:0];
                    _vectorXfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getVectorXpart]];
                    _vectorYfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getVectorYpart]];
                    _vectorZfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getZpart]];
            }
            }
            else{
            if(_magField.isEnabled){
                [defineVectorBar setSelectedSegmentIndex:0];
                
            _magField.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getMag]];
             _angleField.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getAngle]];
                
            }
            }
            
            break;
        case 1:
                if([demMode isEqual:@"1"]){
                    if(_pointOneXfield.isEnabled){
                        [defineVectorBar setSelectedSegmentIndex:1];
                        _pointOneXfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointXone]];
                        _pointOneYfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointYone]];
                        _pointTwoXfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointXtwo]];
                        _pointTwoYfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointYtwo]];
                        _pointTwoZfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointZtwo]];
                         _pointOneZfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointZone]];
                }
                }
                else{
            if(_vectorXfield.isEnabled){
                [defineVectorBar setSelectedSegmentIndex:1];
             _vectorXfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getVectorXpart]];
            _vectorYfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:(NSUInteger)appDelegate.indexVector] getVectorYpart]];
            }
                }
            break;
            
        case 2:
            if(_pointOneXfield.isEnabled){
                [defineVectorBar setSelectedSegmentIndex:2];
            _pointOneXfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointXone]];
            _pointOneYfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointYone]];
            _pointTwoXfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointXtwo]];
            _pointTwoYfield.text = [NSString stringWithFormat:@"%1.2f",[[appDelegate.vectorObjects objectAtIndex:appDelegate.indexVector] getPointYtwo]];
            }
            break;
            
        default:
            break;
    }
    }

}

@end
