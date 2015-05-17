//
//  VectorMath.m
//  Vector Addition
//
//  Created by David Paquette on 6/11/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "VectorMath.h"

@implementation VectorMath



-(double)dotProduct :(double)xOne :(double)yOne :(double)xTwo :(double)yTwo {
    
    
    productDot = (xOne*xTwo)+(yOne*yTwo);
    
    return productDot;
}

-(double)dotProduct :(double)xOne :(double)yOne :(double)zOne :(double)xTwo :(double)yTwo :(double)zTwo;{
    
    productDot = (xOne*xTwo)+(yOne*yTwo)+(zOne*zTwo);
    
    return productDot;
}

-(double)angleBetween :(double)xOne :(double)yOne :(double)xTwo :(double)yTwo{
    
    
    bewtweenAngle = acos(((productDot)/((sqrt(pow(xOne,2)+pow(yOne,2)))*(sqrt(pow(xTwo,2)+pow(yTwo,2))))));
    
    return bewtweenAngle;
}

-(double)angleBetween :(double)xOne :(double)yOne :(double)zOne :(double)xTwo :(double)yTwo :(double)zTwo{
    
    bewtweenAngle = acos(((productDot)/((sqrt(pow(xOne,2)+pow(yOne,2)+pow(zOne,2)))*(sqrt(pow(xTwo,2)+pow(yTwo,2)+pow(zTwo,2))))));
    
    
    return bewtweenAngle;
}

-(VectorClass*)crossProduct :(VectorClass*)vOne :(VectorClass*)vTwo{

    crossVector = [VectorClass new];
    [crossVector setDimMode:true];
    
    if([vOne getThree]){
        
        
       [crossVector setVectorParts:([vOne getYpart]*[vTwo getZpart]-[vOne getZpart]*[vTwo getYpart]) :-([vOne getXpart]*[vTwo getZpart]-[vOne getZpart]*[vTwo getXpart]) :([vOne getXpart]*[vTwo getYpart]-[vOne getYpart]*[vTwo getXpart])];
    }
    else{
        
    [crossVector setVectorParts:0 :0 :([vOne getXpart]*[vTwo getYpart]-[vOne getYpart]*[vTwo getXpart])];
        
    }
    return crossVector;
}

-(NSString*)getCross{
    
    return [crossVector vectorString];
}


@end


