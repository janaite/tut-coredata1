//
//  JJNViewController.m
//  coredataExemplo1
//
//  Created by Jorge Janaite Neto on 6/11/13.
//  Copyright (c) 2013 Jorge Janaite Neto. All rights reserved.
//

#import "JJNViewController.h"

@interface JJNViewController ()

@end

@implementation JJNViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btSave:(id)sender {
    JJNAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];

    NSManagedObject *newContact =
        [NSEntityDescription insertNewObjectForEntityForName:@"Contacts" inManagedObjectContext:context];
    
    [newContact setValue:_txtName.text forKey:@"name"];
    [newContact setValue:_txtPhone.text forKey:@"phone"];
    [newContact setValue:_txtAddress.text forKey:@"address"];
    
    _txtName.text = @"";
    _txtAddress.text = @"";
    _txtPhone.text = @"";
    
    NSError *error;
    [context save:&error];
    _txtStatus.text = @"Save OK!";
    
}

- (IBAction)btFind:(id)sender {
    JJNAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
//    NSEntityDescription *entityDesc =
//        [NSEntityDescription entityForName: @"Contacts" inManagedObjectContext:context];
    
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity: entityDesc];

    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Contacts"];

    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", _txtName.text];
    [request setPredicate: pred];
    
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if([objects count] == 0) {
        _txtStatus.text = @"No matches";
    }
    else {
        matches = objects[0];
        _txtName.text = [matches valueForKey:@"name"];
        _txtAddress.text = [matches valueForKey:@"address"];
        _txtPhone.text = [matches valueForKey:@"phone"];
        
        _txtStatus.text = [NSString stringWithFormat:@"%d matches found", [objects count]];
    }
    
}
@end
