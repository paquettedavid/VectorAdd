//
//  VectorClass.h
//  Vector Addition
//
//  Created by David Paquette on 6/3/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VectorClass : NSObject{
    double xPart;
    double yPart;
    double zPart;
    
    double angle;
    double magnitude;
    double rAngle;
    double xOne;
    double yOne;
    double zOne;
    
    double xTwo;
    double yTwo;
    double zTwo;
    
    Boolean isRadians;
    NSString *name;
    int dataSource;
    double radAngle;
    Boolean isThreeD;
    NSString *combined;
    Boolean isNew;
}

-(void)setVectorParts:(double)x :(double)y;
-(void)setVectorPoints:(double)xone :(double)yone :(double)xtwo :(double)ytwo;
-(void)setVectorPoints:(double)xone :(double)yone :(double)xtwo :(double)ytwo :(double)zone :(double)ztwo;
-(void)setAngleAndMag:(double)angle :(double)mag;

-(double)getVectorXpart;
-(double)getVectorYpart;

-(void)calculateVectorPartsUsingPoints;
-(void)calculateVectorPartsUsingAngleAndMag;


-(double)calculateAngle;
-(double)calculateMagnitude;

-(NSString*)getName;
-(void)setName:(NSString*)Name;

- (NSString *)description;
-(int)originalDataSource;
-(void)setSourceData: (int)sourceNumb;

-(double)getAngle;
-(double)getMag;

-(double)getPointXone;
-(double)getPointYtwo;
-(double)getPointXtwo;
-(double)getPointYone;
-(double)getPointZtwo;
-(double)getPointZone;

-(void)calculateParts;
-(double)getXpart;
-(double)getYpart;
-(double)getZpart;
-(NSString*)vectorString;
-(void)setAngleMode: (Boolean)mode; //false is deg
-(void)setDimMode: (Boolean)mode;

-(void)setVectorParts:(double)x :(double)y :(double)z;


-(Boolean)getNew;
-(void)settNew: (Boolean)New;
-(Boolean)getThree;
-(void)setyPart:(double)input;
@end
