//
//  LoginViewController.m
//  Project Kramer
//
//  Created by Tim Cook on 29/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "LoginViewController.h"
#import "NewUserViewController.h"
#import "HomeTabBarController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
  NewUserViewController *source = (NewUserViewController *)[segue sourceViewController];
  User *user = source.user;

  if(!!user) {
    self.user = user;
  }
}

- (void)viewDidAppear:(BOOL)animated {
  if(self.user) {
    [self performSegueWithIdentifier:@"userHasLoggedIn" sender:self];
  }
  
  NSString *url = @"http://0.0.0.0:3000/test";
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
  
  NSURLResponse *resp = nil;
  NSError *err = nil;
  NSData *response = [NSURLConnection sendSynchronousRequest: request returningResponse: &resp error: &err];
  NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: response options: NSJSONReadingMutableContainers error: &err];
  
  if (!jsonArray) {
    NSLog(@"Error parsing JSON: %@", err);
  } else {
    for(NSDictionary *item in jsonArray) {
      NSLog(@" %@", item);
      NSLog(@"---------------------------------");
    }
  }
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
