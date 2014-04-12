//
//  User.m
//  Project Kramer
//
//  Created by Tim Cook on 29/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "User.h"

@implementation User

-(NSMutableString *)name {
  NSLog(@"%@ %@", self.firstName, self.lastName);
  NSMutableString *name = [self.firstName mutableCopy];
  [name appendString:@" "];
  [name appendString:self.lastName];
  
  return name;
}

@end
