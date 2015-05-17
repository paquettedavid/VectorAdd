//
//  VectorMath.h
//  Vector Addition
//
//  Created by David Paquette on 6/11/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VectorClass.h"

@interface VectorMath : NSObject
{
    VectorClass *crossVector;
    
    double productDot;
    double bewtweenAngle;
    
    
}

-(double)dotProduct :(double)xOne :(double)yOne :(double)xTwo :(double)yTwo;
-(double)dotProduct :(double)xOne :(double)yOne :(double)zOne :(double)xTwo :(double)yTwo :(double)zTwo;

-(VectorClass*)crossProduct :(VectorClass*)vOne :(VectorClass*)vTwo;

-(double)angleBetween :(double)xOne :(double)yOne :(double)xTwo :(double)yTwo;
-(double)angleBetween :(double)xOne :(double)yOne :(double)zOne :(double)xTwo :(double)yTwo :(double)zTwo;
-(NSString*)getCross;

@end
