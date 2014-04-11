//
//  ItemsTableViewController.h
//  Project Kramer
//
//  Created by Tim Cook on 26/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ItemsTableViewController : UITableViewController

-(IBAction)unwindToList:(UIStoryboardSegue *)segue;
@property NSMutableArray *items;

@end
