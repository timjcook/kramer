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
  
    NSString *url = @"http://0.0.0.0:3000/user/new";

    NSMutableDictionary *json = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *user_data = [[NSMutableDictionary alloc] init];
    [user_data setObject:self.user.firstName forKey:@"first_name"];
    [user_data setObject:self.user.lastName forKey:@"last_name"];
    [user_data setObject:@"test@example.com" forKey:@"email"];
    [json setObject:user_data forKey:@"user"];
    
//    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
    NSString *postLength = [NSString stringWithFormat:@"%d",[jsonData length]];
//    NSString *post = [NSString stringWithFormat:@"first_name=%@&last_name=%@&email=test@example.com", self.user.firstName, self.user.lastName];
    NSString *post = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:url]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:jsonData];

//    NSMutableURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
  
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
    
    [self performSegueWithIdentifier:@"userHasLoggedIn" sender:self];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([segue.identifier isEqualToString:@"userHasLoggedIn"]) {
    HomeTabBarController *destination = segue.destinationViewController;
    
    destination.user = self.user;
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
