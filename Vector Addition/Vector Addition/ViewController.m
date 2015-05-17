//
//  ViewController.m
//  Vector Addition
//
//  Created by David Paquette on 6/2/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO;
}

-(void) viewDidAppear:(BOOL)animated {
    
    
   }
-(void) viewWillAppear:(BOOL)animated {
    
     appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //_barTop.tintColor = [UIColor whiteColor];
 resultVector = [VectorCalculatons new];
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserDimensionValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
     demMode = [NSString stringWithContentsOfFile:fileAtPath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    
    
    
    
    
    NSString* filePathA = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameA = @"UserAngleValue.txt";
    NSString* fileAtPathA = [filePathA stringByAppendingPathComponent:fileNameA];
    
    
    
    viewAngleMode = [NSString stringWithContentsOfFile:fileAtPathA
                                                    encoding:NSUTF8StringEncoding
                                                       error:NULL];
    
    if([demMode isEqual:@"1"])
    {
        _demLabel.text = @"3D";
        
    }
    else{
        
        _demLabel.text = @"2D";
    }
    
    
    if([viewAngleMode isEqual:@"1"])
    {
        _angleStatus.text = @"RAD";
        
    }
    else{
        
         _angleStatus.text = @"DEG";
    }

    
    if(appDelegate.vectorObjects.count != 0)
    {
        [resultVector setArray:appDelegate.vectorObjects];
        NSString* magText = [NSString stringWithFormat:@"%1.3f", [resultVector calculateMagnitude]]; 
        viewAngle = [NSString stringWithFormat:@"%1.3f", [resultVector calculateResultAngle]];
         magText = [NSString stringWithFormat:@"%@%@", @"| ", magText];
         magText = [NSString stringWithFormat:@"%@%@", magText,@" |"];
        _magLabel.text = magText;

        if(!([viewAngle isEqual:@"nan"]))
        {
     
            if([viewAngleMode isEqual:@"1"])
               {
                  
                       _angleLabel.text = [NSString stringWithFormat:@"%@%@", viewAngle, @""];
               }
            
            else{
 
                _angleLabel.text = [NSString stringWithFormat:@"%@%@", viewAngle, @"°"];
            }
            
             _vectorLabel.text = [resultVector calculateVector];
        }
        else
        {
      
            if([viewAngleMode isEqual:@"1"]){
            _angleLabel.text = [NSString stringWithFormat:@"%@%@", @"0", @""];
        
                if([demMode isEqual:@"1"]){
                    _vectorLabel.text = @"<0, 0, 0>";
                }
                else{
                    _vectorLabel.text = @"<0, 0>";
                }

            }
            else{
                _angleLabel.text = [NSString stringWithFormat:@"%@%@", @"0", @"°"];
              
                if([demMode isEqual:@"1"]){
                    _vectorLabel.text = @"<0, 0, 0>";
                }
                else{
                    _vectorLabel.text = @"<0, 0>";
                }

            }
        }
    }

    else{
        if([viewAngleMode isEqual:@"1"]){
            if([demMode isEqual:@"1"]){
                _vectorLabel.text = @"";
            }
            else{
                _vectorLabel.text = @"";
            }
            _angleLabel.text = [NSString stringWithFormat:@"%@%@", @"", @""];
            _betweenAngleLabel.text = @"";
        }
        else{
            _angleLabel.text = [NSString stringWithFormat:@"%@%@", @"", @""];
            _betweenAngleLabel.text = @"";
            if([demMode isEqual:@"1"]){
                _vectorLabel.text = @"";
            }
            else{
                _vectorLabel.text = @"";
            }
        }

        
    }
    

    
    if([demMode isEqual:@"1"]){
        
        _angleLabel.enabled = false;
        _angleLabel.text  = @"";
        _angleThreeLabel.alpha = .5;
        
    }
    else{
        _angleLabel.enabled = true;
        _angleLabel.alpha = 1;
        _angleThreeLabel.alpha = 1;
    }
    
    
    
    
    if(appDelegate.vectorObjects.count == 2){
        
        
        _dotSlabel.alpha = 1;
        _dotLabel.alpha = 1;
        _crossLabel.alpha = 1;
        _crossSlabel.alpha = 1;
        _betweenAngleLabel.alpha = 1;
        _angleSlabel.alpha = 1;
        
        mathCalc = [VectorMath new];
        
       
        if([demMode isEqual:@"1"]){
            
             _dotLabel.text = [NSString stringWithFormat:@"%1.3f", [mathCalc dotProduct:[[appDelegate.vectorObjects objectAtIndex:0]getXpart] :[[appDelegate.vectorObjects objectAtIndex:0]getYpart] :[[appDelegate.vectorObjects objectAtIndex:0]getZpart] :[[appDelegate.vectorObjects objectAtIndex:1]getXpart] :[[appDelegate.vectorObjects objectAtIndex:1]getYpart] :[[appDelegate.vectorObjects objectAtIndex:1]getZpart]]];
            
            angleView = [mathCalc angleBetween:[[appDelegate.vectorObjects objectAtIndex:0]getXpart] :[[appDelegate.vectorObjects objectAtIndex:0]getYpart] :[[appDelegate.vectorObjects objectAtIndex:0]getZpart] :[[appDelegate.vectorObjects objectAtIndex:1]getXpart] :[[appDelegate.vectorObjects objectAtIndex:1]getYpart] :[[appDelegate.vectorObjects objectAtIndex:1]getZpart]];
           
            
        }
        else{
             _dotLabel.text = [NSString stringWithFormat:@"%1.3f", [mathCalc dotProduct:[[appDelegate.vectorObjects objectAtIndex:0]getXpart] :[[appDelegate.vectorObjects objectAtIndex:0]getYpart] :[[appDelegate.vectorObjects objectAtIndex:1]getXpart] :[[appDelegate.vectorObjects objectAtIndex:1]getYpart]]];
            
             angleView = [mathCalc angleBetween:[[appDelegate.vectorObjects objectAtIndex:0]getXpart] :[[appDelegate.vectorObjects objectAtIndex:0]getYpart] :[[appDelegate.vectorObjects objectAtIndex:1]getXpart] :[[appDelegate.vectorObjects objectAtIndex:1]getYpart]];
            
        }
        
        if([_dotLabel.text isEqual:@"-0.000"]){
            _dotLabel.text = @"0.000";
        }
        
        if([viewAngleMode isEqual:@"1"]){
             NSString *angleText = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:@"%1.3f", angleView],@"°"];
            if ([angleText isEqual:@"nan°"]) {
                _betweenAngleLabel.text = @"0";
            }
            else{
            _betweenAngleLabel.text = [NSString stringWithFormat:@"%1.3f", angleView];
            }
        }
        
        else{
             angleView = angleView*(180/3.141592654);
            NSString *angleText = [NSString stringWithFormat:@"%@%@", [NSString stringWithFormat:@"%1.3f", angleView],@"°"];
            if ([angleText isEqual:@"nan°"]) {
                _betweenAngleLabel.text = @"0°";
            }
            else{
            _betweenAngleLabel.text = angleText;
            }
        }
        
        [mathCalc crossProduct:[appDelegate.vectorObjects objectAtIndex:0] :[appDelegate.vectorObjects objectAtIndex:1]];
        _crossLabel.text = [mathCalc getCross];
        
        
    }
    else{
        _dotSlabel.alpha = .3;
        _dotLabel.alpha = .3;
        _crossLabel.alpha = .3;
        _crossSlabel.alpha = .3;
        _betweenAngleLabel.alpha = .3;
        _angleSlabel.alpha = .3;
    }
    
    if([_dotLabel.text isEqual:@"0.000"] && [_crossLabel.text isEqual:@"< 0.0, 0.0, 0.0 >"]){
        _orthLabel.text = @"";
        _paraLabel.text = @"";
        
    }
    if([_dotLabel.text isEqual:@"0.000"] && !([_crossLabel.text isEqual:@"< 0.0, 0.0, 0.0 >"])){
        _orthLabel.text = @"(orthogonal)";
        _paraLabel.text = @"";
        
    }
    if(!([_dotLabel.text isEqual:@"0.000"]) && [_crossLabel.text isEqual:@"< 0.0, 0.0, 0.0 >"]){
        _orthLabel.text = @"";
        _paraLabel.text = @"(parallel)";
        
    
    }
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dummyButton:(UIButton *)sender {
}

- (IBAction)editButton:(UIBarButtonItem *)sender {
}

- (IBAction)newCalculationButton:(UIButton *)sender {
    if(appDelegate.vectorObjects.count == 0)
    {
      [dummyButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        
        VectorListView *ListView =
        [self.storyboard instantiateViewControllerWithIdentifier:@"ListView"];
        [self presentViewController:ListView animated:YES completion:nil];

    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setTitle:@"Are you sure?"];
        [alert setMessage:@"Your current list, and all its vectors, will be deleted."];
        [alert setDelegate:self];
        [alert addButtonWithTitle:@"Yes"];
        [alert addButtonWithTitle:@"Cancel"];
        [alert show];
        [dummyButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    

        }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //Clear Array of Objects
        VectorListView *ListView =
        [self.storyboard instantiateViewControllerWithIdentifier:@"ListView"];
        [self presentViewController:ListView animated:YES completion:nil];
        [appDelegate.vectorObjects removeAllObjects];
        appDelegate.indexCell = 0;
    }
    else if (buttonIndex == 1)
    {
       
           }
}


-(void)calculateData{
   

}


@end
