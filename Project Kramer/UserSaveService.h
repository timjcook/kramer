//
//  UserSaveService.h
//  Project Kramer
//
//  Created by Tim Cook on 12/04/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "LoginViewController.h"

@interface UserSaveService : NSObject

-(void)save:(LoginViewController *)delegate;
@property User *user;

@end
