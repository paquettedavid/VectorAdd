//
//  VectorCalculatons.h
//  Vector Addition
//
//  Created by David Paquette on 6/4/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VectorClass.h"

@interface VectorCalculatons : VectorClass
{
    NSMutableArray* arrayOfVectors;
    double totalXparts;
    double totalYparts;
    double totalZparts;
    
    VectorClass* resultVector;
    NSString *demMode;
    Boolean dMode;
}
-(double)calculateMagnitude;
-(double)calculateResultAngle;
-(NSString*)calculateVector;
- (void) setArray:(NSMutableArray*)array;
@end
