//
//  AppDelegate.h
//  Vector Addition
//
//  Created by David Paquette on 6/2/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VectorClass.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *vectorObjects;
    int indexCell;
    int indexVector;
}
@property int indexCell;

@property int indexVector;
@property (strong, nonatomic)NSMutableArray *vectorObjects;
@property (strong, nonatomic) UIWindow *window;

@end
