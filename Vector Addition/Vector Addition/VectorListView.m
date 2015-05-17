//
//  VectorListView.m
//  Vector Addition
//
//  Created by David Paquette on 6/3/13.
//  Copyright (c) 2013 David Paquette. All rights reserved.
//

#import "VectorListView.h"
#import "VectorObjectView.h"

@interface VectorListView ()

@end

@implementation VectorListView

- (void)awakeFromNib
{
    [super awakeFromNib];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    [self tableView];
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"UserAngleValue.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    
    
    NSString* content = [NSString stringWithContentsOfFile:fileAtPath
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    
    NSString* filePathD = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileNameD = @"UserDimensionValue.txt";
    NSString* fileAtPathD = [filePathD stringByAppendingPathComponent:fileNameD];
    
    
    
    demMode = [NSString stringWithContentsOfFile:fileAtPathD
                                        encoding:NSUTF8StringEncoding
                                           error:NULL];

    
    
    
    
    if([content isEqual:@"1"]){
        angleMode = true;
    }
    else{
        angleMode = false;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject
{
    if (!appDelegate.vectorObjects) {
        appDelegate.vectorObjects = [[NSMutableArray alloc] init];
    }
    if(appDelegate.vectorObjects.count ==0){
        appDelegate.indexCell = 0;
    }
    NSString *ob = @"Vector ";
    int countObjects = appDelegate.vectorObjects.count;
    appDelegate.indexCell++;
    NSString *strFromInt = [NSString stringWithFormat:@"%d",appDelegate.indexCell];
    
    NSString *combined = [NSString stringWithFormat:@"%@%@", ob, strFromInt];
    VectorClass *newVector = [VectorClass new];
    if([demMode isEqual:@"1"]){
        [newVector setDimMode:true];
      
    }
    else{
        [newVector setDimMode:false];
    
    }
    [newVector setName:combined];
  
    if(angleMode == true){
        [newVector setAngleMode:true];
    }
    else{
        [newVector setAngleMode:false];
    }
    [appDelegate.vectorObjects insertObject:newVector atIndex:countObjects];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:appDelegate.vectorObjects.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return appDelegate.vectorObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [appDelegate.vectorObjects[indexPath.row] description];
    cell.detailTextLabel.text = [appDelegate.vectorObjects[indexPath.row] vectorString];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [appDelegate.vectorObjects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        if(appDelegate.vectorObjects.count !=0){
        for(int index = indexPath.row; index <= appDelegate.vectorObjects.count-1;index++){
            
            NSString *indexString = [NSString stringWithFormat:@"%d", index+1];
            
            NSString *name = [NSString stringWithFormat:@"%@%@",@"Vector ", indexString];
            [[appDelegate.vectorObjects objectAtIndex:index] setName:name];
           // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        }
        appDelegate.indexCell = appDelegate.indexCell-1;
        
                
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {

    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //if ([[segue identifier] isEqualToString:@"showDetail"]) {
       
    //}
  
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int indexOne  = indexPath.row;
    appDelegate.indexVector = indexOne;
    

    
    //[[segue destinationViewController] setDetailItem:indexOne]; //send object to next view
    
}


- (IBAction)addButton:(UIBarButtonItem *)sender {
    [self insertNewObject];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPatht {
  
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int indexOne  = indexPath.row;
    appDelegate.indexVector = indexOne;
    
    if([demMode isEqual:@"1"]) {
        VectorObjectView *threeView =
        [self.storyboard instantiateViewControllerWithIdentifier:@"threeView"];
        [self presentViewController:threeView animated:YES completion:nil];
    }
    else {
        VectorObjectView *twoView =
        [self.storyboard instantiateViewControllerWithIdentifier:@"twoView"];
        [self presentViewController:twoView animated:YES completion:nil];
    }
}


@end
