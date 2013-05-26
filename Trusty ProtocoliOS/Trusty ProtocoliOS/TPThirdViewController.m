//
//  TPThirdViewController.m
//  Trusty ProtocoliOS
//
//  Created by superCat on 25/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import "TPThirdViewController.h"

@interface TPThirdViewController ()

@end

@implementation TPThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
           self.title = NSLocalizedString(@"Third", nil);
           self.tabBarItem.image = [UIImage imageNamed:@"third.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
