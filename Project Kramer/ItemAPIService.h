//
//  ItemSaveService.h
//  Project Kramer
//
//  Created by Tim Cook on 12/04/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "ItemsTableViewController.h"

@interface ItemAPIService : NSObject

-(void)save;
-(void)getItems:(ItemsTableViewController *)controller;
@property Item *item;

@end
