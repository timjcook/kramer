//
//  NewUserViewController.m
//  Project Kramer
//
//  Created by Tim Cook on 29/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "NewUserViewController.h"

@interface NewUserViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation NewUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  self.firstNameTextField.delegate = self;
  self.lastNameTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if(self.firstNameTextField.text.length && self.lastNameTextField.text.length) {
    User *user = [[User alloc] init];
    user.firstName = self.firstNameTextField.text;
    user.lastName = self.lastNameTextField.text;
    self.user = user;
  }
}

-(BOOL)textFieldShouldReturn: (UITextField *) textField {
  [textField resignFirstResponder];
  return YES;
}

@end
