//
//  AddNewItemViewController.m
//  Project Kramer
//
//  Created by Tim Cook on 26/03/2014.
//  Copyright (c) 2014 Tim Cook. All rights reserved.
//

#import "AddNewItemViewController.h"

@interface AddNewItemViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;


@end

@implementation AddNewItemViewController

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
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if(sender != self.doneButton) return;
  
  if(self.itemNameTextField.text.length > 0) {
    self.item = [[Item alloc] init];
    self.item.name = self.itemNameTextField.text;
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
