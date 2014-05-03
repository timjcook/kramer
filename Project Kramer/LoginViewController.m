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
#import "UserSaveService.h"

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
    UserSaveService *save_service = [[UserSaveService alloc] init];
    [save_service setUser:self.user];
    [save_service save:self];
  }
}

- (void)logIn {
  [self performSegueWithIdentifier:@"userHasLoggedIn" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if([segue.destinationViewController isKindOfClass:[HomeTabBarController class]]) {
    HomeTabBarController *dest = segue.destinationViewController;
    dest.user = self.user;
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
