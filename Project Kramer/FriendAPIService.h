//
//  FriendAPIService.h
//  Project Kramer
//
//  Created by Tim Cook on 12/04/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendsTableViewController.h"
#import "User.h"

@interface FriendAPIService : NSObject

@property User *sending_user;
@property User *receiving_user;
-(void)save:(FriendsTableViewController *)delegate;
-(void)getFriends:(FriendsTableViewController *)delegate;

@end
