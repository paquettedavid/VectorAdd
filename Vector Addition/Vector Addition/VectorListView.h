//
//  VectorListView.h
//  Vector Addition
//
//  Created by David Paquette on 6/3/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VectorClass.h"
#import "AppDelegate.h"

@interface VectorListView : UITableViewController 
{
    AppDelegate *appDelegate;
    UITableViewCell *cell;
    Boolean angleMode;
    NSString* demMode;
    
}

- (IBAction)addButton:(UIBarButtonItem *)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
