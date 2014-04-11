//
//  ItemSaveService.m
//  Project Kramer
//
//  Created by Tim Cook on 12/04/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "ItemAPIService.h"
#import "Item.h"

@implementation ItemAPIService

-(void)save {
  NSString *url = @"http://0.0.0.0:3000/item/new";
  NSDictionary *json = @{
    @"item":@{
      @"name": self.item.name,
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
                                       success:^(AFHTTPRequestOperation *operation, id responseObject){
                                         NSLog(@"Submit response data: %@", responseObject);} // success callback block
                                       failure:^(AFHTTPRequestOperation *operation, NSError *error){
                                         NSLog(@"Error: %@", error);} // failure callback block
                                       ];

}

-(void)getItems:(ItemsTableViewController *)delegate {
  NSURL *url = [NSURL URLWithString:@"http://0.0.0.0:3000/item/all"];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  //AFNetworking asynchronous url request
  AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
  
  operation.responseSerializer = [AFJSONResponseSerializer serializer];
  [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    NSLog(@"The Array: %@", responseObject);
    
    for(id entry in responseObject) {
      Item *item = [[Item alloc] init];
      item.name = [entry objectForKey:@"name"];
      [items addObject:item];
    }

    delegate.items = items;
    [delegate.tableView reloadData];
    
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Request Failed: %@, %@", error, error.userInfo);
    
  }];
  
  [operation start];

}



@end
