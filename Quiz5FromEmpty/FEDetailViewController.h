//
//  FEDetailViewController.h
//  Quiz5FromEmpty
//
//  Created by Michael Toth on 3/16/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FETask.h"

@interface FEDetailViewController : UIViewController <UITextFieldDelegate>
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISlider *urgencySlider;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)sliderChanged:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (nonatomic, retain) FETask *task;
@end
