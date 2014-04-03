//
//  ItemsTableViewController.m
//  Project Kramer
//
//  Created by Tim Cook on 26/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "Item.h"
#import "ItemsTableViewController.h"
#import "HomeTabBarController.h"
#import "AddNewItemViewController.h"

@interface ItemsTableViewController ()

@property NSMutableArray *items;

@end

@implementation ItemsTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.items = [[NSMutableArray alloc] init];
  [self loadInitialData];
}

-(void)viewDidAppear:(BOOL)animated {

}

- (void)loadInitialData {
  Item *item1 = [[Item alloc] init];
  item1.name = @"GoPro";
  [self.items addObject:item1];
  Item *item2 = [[Item alloc] init];
  item2.name = @"Surfboard";
  [self.items addObject:item2];
  Item *item3 = [[Item alloc] init];
  item3.name = @"Engineering Systems Design Textbook";
  [self.items addObject:item3];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
  AddNewItemViewController *source = [segue sourceViewController];
  Item *item = source.item;
  
  if(item != nil) {
    [self.items addObject:item];
    [self.tableView reloadData];
  }
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  // Return the number of rows in the section.
  return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"ListPrototypeCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  Item *item = [self.items objectAtIndex:indexPath.row];
  cell.textLabel.text = item.name;
  
  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
