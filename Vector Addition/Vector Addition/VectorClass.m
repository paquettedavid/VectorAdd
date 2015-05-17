//
//  VectorClass.m
//  Vector Addition
//
//  Created by David Paquette on 6/3/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "VectorClass.h"


@implementation VectorClass

-(id)init {
    self = [super init];
    if (self != nil) {
        isRadians = false;
        isThreeD = false;
        isNew = true;
    }
    return self;
}



-(void)setVectorParts:(double)x :(double)y {
    
    xPart = x;
    yPart = y;
    isNew =  false;
}

-(void)setVectorParts:(double)x :(double)y :(double)z {
    
    xPart = x;
    yPart = y;
    zPart = z;
    isNew =  false;

    
}
-(void)setVectorPoints:(double)xone :(double)yone :(double)xtwo :(double)ytwo{
 
    xOne = xone;
    yOne = yone;
    
    xTwo = xtwo;
    yTwo = ytwo;
    isNew =  false;
    
}

-(void)setVectorPoints:(double)xone :(double)yone :(double)xtwo :(double)ytwo :(double)zone :(double)ztwo{
    
    xOne = xone;
    yOne = yone;
    
    xTwo = xtwo;
    yTwo = ytwo;
    
    zOne = zone;
    zTwo = ztwo;
    isNew =  false;
    
}



-(void)setAngleAndMag:(double)Angle :(double)mag{
    
    magnitude = mag;
    if(isRadians){
        rAngle = Angle;
        angle = rAngle*(180/3.141592654);
        
    }
    
    else{
         angle = Angle;
        rAngle = angle*(3.141592654/180);
    }
   
    isNew =  false;
    
 
}

-(double)getVectorXpart{
    
    return xPart;
}
-(double)getVectorYpart{
    
    return yPart;
}

-(double)getVectorZpart{
    
    return zPart;
}

-(void)calculateVectorPartsUsingPoints{

    xPart = xTwo - xOne;
    yPart = yTwo - yOne;
    
    if(isThreeD){

        zPart = zTwo-zOne;
    }
    
}
-(void)calculateVectorPartsUsingAngleAndMag{

    xPart = magnitude*cos(rAngle);
    yPart = magnitude*sin(rAngle);
    
    NSString *test = [NSString stringWithFormat:@"%1.2f", xPart];
    if([test isEqual:@"-0.00"])
    {
        xPart = 0;
    }
    

    
}

-(double)calculateAngle{
    
    rAngle = atan((yPart/xPart));
    
    if(isRadians){
        return rAngle;
    }
    else{
        angle = rAngle*(180/3.141592654);
        return angle;
    }

    
    
}
-(double)calculateMagnitude{
    
    magnitude = sqrt(pow(xPart,2)+pow(yPart, 2));
    
    if(isThreeD){
        magnitude = sqrt(pow(xPart,2)+pow(yPart, 2)+pow(zPart, 2));
    }
    return magnitude;
    
}

-(NSString*)getName{
    return name;
}
-(void)setName:(NSString*)Name{
    name = Name;
    
}
-(NSString*)description{
    return name;
}

-(int)originalDataSource;
{
    return dataSource;
}

-(void)setSourceData: (int)sourceNumb{
    dataSource = sourceNumb;
}

-(double)getAngle{
    if (isRadians){
        return rAngle;
    }
    else{
      return angle;  
    }
    
}
-(double)getMag{
    return magnitude;
}
-(double)getPointXone{
    return xOne;
}
-(double)getPointYtwo{
   return yTwo;
    
}
-(double)getPointXtwo{
    return xTwo;
}
-(double)getPointYone{
    return yOne;
}

-(void)calculateParts{
    if (dataSource == 0 && !(isThreeD)) {
        [self calculateVectorPartsUsingAngleAndMag];
    }
    if (dataSource ==1) {
        
    }
    if (dataSource == 2) {
        [self calculateVectorPartsUsingPoints];
    }
}

-(double)getXpart{
    return xPart;
}
-(double)getYpart{
    return yPart;
}
-(NSString*)vectorString{
    if (isThreeD) {
        combined = @"";
        NSString* vectorX = [NSString stringWithFormat:@"%1.1f", xPart];
        NSString* vectorY = [NSString stringWithFormat:@"%1.1f", yPart];
        if([vectorY isEqual:@"-0.0"]){
            vectorY = @"0.0";
        }
        NSString* vectorZ = [NSString stringWithFormat:@"%1.1f", zPart];
  combined = [NSString stringWithFormat:@"%@%@", @"< ", vectorX];
        combined = [NSString stringWithFormat:@"%@%@", combined, @", "];
        combined = [NSString stringWithFormat:@"%@%@", combined, vectorY];
        combined = [NSString stringWithFormat:@"%@%@", combined, @", "];
        combined = [NSString stringWithFormat:@"%@%@", combined, vectorZ];
        combined = [NSString stringWithFormat:@"%@%@", combined, @" >"];
    }
    else{
        combined = @"";
NSString* vectorX = [NSString stringWithFormat:@"%1.2f", xPart];
NSString* vectorY = [NSString stringWithFormat:@"%1.2f", yPart];
combined = [NSString stringWithFormat:@"%@%@", @"< ", vectorX];
combined = [NSString stringWithFormat:@"%@%@", combined, @" , "];
combined = [NSString stringWithFormat:@"%@%@", combined, vectorY];
combined = [NSString stringWithFormat:@"%@%@", combined, @" >"];
    }
return combined;
}
-(void)setAngleMode: (Boolean)mode{
    isRadians = mode;
}

-(void)setDimMode: (Boolean)mode{
    isThreeD = mode;
}

-(double)getZpart{
    return zPart;
}

-(double)getPointZtwo{
    return zTwo;
    
}
-(double)getPointZone{
    return zOne;
    
}


-(Boolean)getNew{
    return isNew;
}

-(void)settNew: (Boolean)New {
    isNew = New;
    
}
-(Boolean)getThree{
    return isThreeD;
}

-(void)setyPart:(double)input{
    input  = yPart;
}

@end
