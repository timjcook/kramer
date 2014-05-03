//
//  FriendsTableViewController.h
//  Project Kramer
//
//  Created by Tim Cook on 12/04/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface FriendsTableViewController : UITableViewController

@property User *user;
@property NSMutableArray *users;

@end
