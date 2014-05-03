//
//  UserSaveService.m
//  Project Kramer
//
//  Created by Tim Cook on 12/04/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "UserSaveService.h"

@implementation UserSaveService

-(void)save:(LoginViewController *)delegate {
  NSString *url = @"http://0.0.0.0:3000/user/new";
  NSDictionary *json = @{
    @"user":@{
        @"first_name": self.user.firstName,
        @"last_name": self.user.lastName,
        @"email": @"test@example.com"
    }
  };
  
  // it all starts with a manager
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  // in my case, I'm in prototype mode, I own the network being used currently,
  // so I can use a self generated cert key, and the following line allows me to use that
  manager.securityPolicy.allowInvalidCertificates = YES;
  // Make sure we a JSON serialization policy, not sure what the default is
  manager.requestSerializer = [AFJSONRequestSerializer serializer];
  
  // Now we can just PUT it to our target URL (note the https).
  // This will return immediately, when the transaction has finished,
  // one of either the success or failure blocks will fire

  [manager
    POST: url
    parameters: json
    success:^(AFHTTPRequestOperation *operation, id responseObject) {
      NSDictionary *userResponse = responseObject[@"user"];

      User *user = [[User alloc] init];
      NSLog(@"id = %@", userResponse[@"id"]);
      NSLog(@"%@", userResponse[@"first_name"]);
      user.id = [userResponse[@"id"] intValue];
      user.firstName = userResponse[@"first_name"];
      user.lastName = userResponse[@"last_name"];
    
      delegate.user = user;
     
      [delegate logIn];
   } // success callback block
   failure:^(AFHTTPRequestOperation *operation, NSError *error){
     NSLog(@"Error: %@", error);} // failure callback block
   ];
}

@end
