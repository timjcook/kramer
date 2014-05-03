//
//  User.h
//  Project Kramer
//
//  Created by Tim Cook on 29/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSInteger id;
@property NSString *firstName;
@property NSString *lastName;

-(NSString *)name;

@end
