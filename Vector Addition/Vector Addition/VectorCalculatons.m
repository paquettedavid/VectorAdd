//
//  VectorCalculatons.m
//  Vector Addition
//
//  Created by David Paquette on 6/4/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "VectorCalculatons.h"


@implementation VectorCalculatons

- (id) init:(NSMutableArray*)array {
    self = [super init];
    if (self != nil) {
        totalXparts = 0;
        totalYparts = 0;
        totalZparts = 0;
        
    }
    return self;
}

-(double)calculateMagnitude{
    
    
    NSString* filePathD = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameD = @"UserDimensionValue.txt";
    NSString* fileAtPathD = [filePathD stringByAppendingPathComponent:fileNameD];
    
    
    
    demMode = [NSString stringWithContentsOfFile:fileAtPathD
                                        encoding:NSUTF8StringEncoding
                                           error:NULL];
    
    
    
    if ([demMode isEqual:@"1"]) {
        
        dMode = true;
    }
    else{
        dMode = false;
    }
    
    resultVector = [VectorClass new];
    
    if(dMode)
    {
        
        
        [resultVector setDimMode:true];
    }
    else{
        
        [resultVector setDimMode:false];
        
    }

    for (int index = 0; index < arrayOfVectors.count; index++) {
        [[arrayOfVectors objectAtIndex:index]  calculateParts];
        totalXparts = [[arrayOfVectors objectAtIndex:index] getXpart] + totalXparts;
        totalYparts = [[arrayOfVectors objectAtIndex:index]getYpart] + totalYparts;
        if(dMode){
            
        totalZparts = [[arrayOfVectors objectAtIndex:index]getZpart] + totalZparts;
            
        }
    }
    
    if (dMode) {
        [resultVector setVectorParts:totalXparts :totalYparts :totalZparts];
    }
    [resultVector setVectorParts:totalXparts :totalYparts];
    return [resultVector calculateMagnitude];
}
-(double)calculateResultAngle{
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserAngleValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
   NSString *angleMode = [NSString stringWithContentsOfFile:fileAtPath
                                          encoding:NSUTF8StringEncoding
                                             error:NULL];
  
    
    
    
    NSString* filePathD = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameD = @"UserDimensionValue.txt";
    NSString* fileAtPathD = [filePathD stringByAppendingPathComponent:fileNameD];
    
    
    
    demMode = [NSString stringWithContentsOfFile:fileAtPathD
                                        encoding:NSUTF8StringEncoding
                                           error:NULL];

    resultVector = [VectorClass new];
    [resultVector setVectorParts:totalXparts :totalYparts];
    if([angleMode isEqual:@"1"])
    {
        [resultVector setAngleMode:true];
    }
    else{
        
        [resultVector setAngleMode:false];
        
    }
    
    if ([demMode isEqual:@"1"]) {
        dMode = true;
        [resultVector setDimMode:true];
    }
    
    else
    {
        [resultVector setDimMode:false];
        dMode = false;
    }
    
    double angleTwo =[resultVector calculateAngle];
    
    return angleTwo;
}
-(NSString*)calculateVector{
    if(dMode){
        
    NSString* vectorX = [NSString stringWithFormat:@"%1.1f", totalXparts];
    NSString* vectorY = [NSString stringWithFormat:@"%1.1f", totalYparts];
    NSString* vectorZ = [NSString stringWithFormat:@"%1.1f", totalZparts];
    NSString *combinedC = [NSString stringWithFormat:@"%@%@", @"< ", vectorX];
        
    combinedC = [NSString stringWithFormat:@"%@%@", combinedC, @", "];
    combinedC = [NSString stringWithFormat:@"%@%@", combinedC, vectorY];
     combinedC = [NSString stringWithFormat:@"%@%@", combinedC, @", "];
     combinedC = [NSString stringWithFormat:@"%@%@", combinedC, vectorZ];
    combinedC = [NSString stringWithFormat:@"%@%@", combinedC, @" >"];
        return combinedC;
    }
    else{
       
        NSString* vectorX = [NSString stringWithFormat:@"%1.2f", totalXparts];
        NSString* vectorY = [NSString stringWithFormat:@"%1.2f", totalYparts];
        NSString *combinedC = [NSString stringWithFormat:@"%@%@", @"< ", vectorX];
        combinedC = [NSString stringWithFormat:@"%@%@", combinedC, @", "];
        combinedC = [NSString stringWithFormat:@"%@%@", combinedC, vectorY];
        combinedC = [NSString stringWithFormat:@"%@%@", combinedC, @" >"];
        return combinedC;
    }
    
}

- (void) setArray:(NSMutableArray*)array{
    arrayOfVectors = array;
}




@end
