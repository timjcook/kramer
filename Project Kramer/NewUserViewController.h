//
//  NewUserViewController.h
//  Project Kramer
//
//  Created by Tim Cook on 29/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface NewUserViewController : UIViewController <UITextFieldDelegate>

@property User *user;

@end
