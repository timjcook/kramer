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
    NSDictionary *json = @{@"user": @{@"first_name": self.user.firstName, @"last_name": self.user.lastName, @"email": @"test@example.com"}
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

    
    [self performSegueWithIdentifier:@"userHasLoggedIn" sender:self];
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
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
