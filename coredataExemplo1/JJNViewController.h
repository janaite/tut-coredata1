//
//  JJNViewController.h
//  coredataExemplo1
//
//  Created by Jorge Janaite Neto on 6/11/13.
//  Copyright (c) 2013 Jorge Janaite Neto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJNAppDelegate.h"  // JJN

@interface JJNViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UILabel *txtStatus;

- (IBAction)btSave:(id)sender;
- (IBAction)btFind:(id)sender;

@end
