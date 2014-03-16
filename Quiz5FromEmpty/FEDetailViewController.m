//
//  FEDetailViewController.m
//  Quiz5FromEmpty
//
//  Created by Michael Toth on 3/16/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "FEDetailViewController.h"

@interface FEDetailViewController ()

@end

@implementation FEDetailViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
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
    [self.nameTextField setDelegate:self];
    [self.nameTextField setText:[_task taskName]];
    self.urgencySlider.value = [_task urgency];
    [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency: %.2f",[_task urgency]]];
    self.datePicker.date = [_task dueDate];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    _task.taskName = self.nameTextField.text;
    _task.urgency = self.urgencySlider.value;
    _task.dueDate = [self.datePicker date];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    [self.urgencyLabel setText:[NSString stringWithFormat:@"Urgency:%.2f",self.urgencySlider.value]];
}

@end
