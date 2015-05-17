//
//  AppDelegate.m
//  Vector Addition
//
//  Created by David Paquette on 6/2/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize indexCell;
@synthesize vectorObjects;
@synthesize indexVector;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    vectorObjects = [[NSMutableArray alloc] init];
    indexCell = 0;
    indexVector = 0;
    
    
    
        
    NSString* filePathD = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameD = @"UserDimensionValue.txt";
    NSString* fileAtPathD = [filePathD stringByAppendingPathComponent:fileNameD];
    
    
    
    NSString *demMode = [NSString stringWithContentsOfFile:fileAtPathD
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    Boolean test = true;
    int index = 0;
    if([demMode isEqual:@"1"]){
        while(test){
            
            
            
            NSString *indexString = [NSString stringWithFormat:@"%d", index+1];
          
            NSString *saveString = [NSString stringWithFormat:@"%@%@",@"Vector ", indexString];
            NSString *name = [NSString stringWithFormat:@"%@%@",@"Vector ", indexString];
            saveString = [NSString stringWithFormat:@"%@%@",saveString,@".txt"];
            NSString* filePathA = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString* fileNameA =saveString;
            NSString* fileAtPathA = [filePathA stringByAppendingPathComponent:fileNameA];
            
            if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPathA]) {
                test = false;
            }
            else if(test){
                NSString* fileContents = [NSString stringWithContentsOfFile:fileAtPathA encoding:NSUTF8StringEncoding error:nil];
                NSArray *array = [fileContents componentsSeparatedByString:@"\n"];
              
                for(int i = 0; array.count >i;i++){
                    
                }
                VectorClass *newVector = [VectorClass new];
                [newVector setDimMode:true];
                [newVector setName:name];
                [newVector setVectorParts:[[array objectAtIndex:0] doubleValue ]: [[array objectAtIndex:1] doubleValue]: [[array objectAtIndex:2] doubleValue]];
                
                [newVector setSourceData:0];
                [vectorObjects insertObject:newVector atIndex:index];
                [[NSFileManager defaultManager] removeItemAtPath: fileAtPathA error:NULL];
            }
            index++;
        }
        indexCell = index -1;
    }
    else{
        while(test){
            
            
            
            NSString *indexString = [NSString stringWithFormat:@"%d", index+1];
            
            NSString *saveString = [NSString stringWithFormat:@"%@%@",@"Vector ", indexString];
            NSString *name = [NSString stringWithFormat:@"%@%@",@"Vector ", indexString];
            saveString = [NSString stringWithFormat:@"%@%@",saveString,@".txt"];
            NSString* filePathA = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString* fileNameA =saveString;
            NSString* fileAtPathA = [filePathA stringByAppendingPathComponent:fileNameA];
           
            if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPathA]) {
                test = false;
        
            }
            else if(test){
                NSString* fileContents = [NSString stringWithContentsOfFile:fileAtPathA encoding:NSUTF8StringEncoding error:nil];
                NSArray *array = [fileContents componentsSeparatedByString:@"\n"];
            
                for(int i = 0; array.count >i;i++){
                    
                    
                }
                VectorClass *newVector = [VectorClass new];
                [newVector setDimMode:false];
                [newVector setName:name];
                [newVector setVectorParts:[[array objectAtIndex:0] doubleValue ]: [[array objectAtIndex:1] doubleValue]];
              
                [newVector setSourceData:1];
                [newVector calculateAngle];
                [newVector calculateMagnitude];
                [vectorObjects insertObject:newVector atIndex:index];
                [[NSFileManager defaultManager] removeItemAtPath: fileAtPathA error:NULL];
            }
            index++;
        }
        indexCell = index -1;
    }

    
    
    
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSString *newLine = @"\n";
    
    
    
    NSString* filePathD = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameD = @"UserDimensionValue.txt";
    NSString* fileAtPathD = [filePathD stringByAppendingPathComponent:fileNameD];
    
    
    
    NSString *demMode = [NSString stringWithContentsOfFile:fileAtPathD
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    if([demMode isEqual:@"1"]){
        for(int index = 0; index < vectorObjects.count; index++){
            NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString* fileName = [NSString stringWithFormat:@"%@%@",[[vectorObjects objectAtIndex:index] getName] , @".txt"];
            
            
            NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
            if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
                [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
            }
            
            NSString *xPart =  [NSString stringWithFormat:@"%1.2f", [[vectorObjects objectAtIndex:index]getXpart]];
            NSString *yPart =  [NSString stringWithFormat:@"%1.2f", [[vectorObjects objectAtIndex:index]getYpart]];
            NSString *zPart =  [NSString stringWithFormat:@"%1.2f", [[vectorObjects objectAtIndex:index]getZpart]];

            NSString *saveString = [NSString stringWithFormat:@"%@%@",xPart, newLine];
            saveString = [NSString stringWithFormat:@"%@%@",saveString, yPart];
            saveString = [NSString stringWithFormat:@"%@%@",saveString, newLine];
            saveString = [NSString stringWithFormat:@"%@%@",saveString, zPart];

            
            [[saveString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
            
        }
    }
    else{
        for(int index = 0; index < vectorObjects.count; index++){
            NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString* fileName = [NSString stringWithFormat:@"%@%@",[[vectorObjects objectAtIndex:index] getName] , @".txt"];
            
            
            NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
            if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
                [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
            }
            
            NSString *xPart =  [NSString stringWithFormat:@"%1.2f", [[vectorObjects objectAtIndex:index]getXpart]];
            NSString *yPart =  [NSString stringWithFormat:@"%1.2f", [[vectorObjects objectAtIndex:index]getYpart]];

            NSString *saveString = [NSString stringWithFormat:@"%@%@",xPart, newLine];
            saveString = [NSString stringWithFormat:@"%@%@",saveString, yPart];

            
            [[saveString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];

        }
    }
     }

- (void)applicationWillEnterForeground:(UIApplication *)application
{
        
    

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
