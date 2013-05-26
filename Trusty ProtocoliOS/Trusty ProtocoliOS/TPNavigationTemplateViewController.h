//
//  TPNavigationTemplateViewController.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPCataTypeTableViewController.h"
#import "TPinfoTypeTableViewController.h"



/*
@protocol TPNavigationTemplateProtocol

-(void) dismissNavigationController;

@end
*/

@interface TPNavigationTemplateViewController : UIViewController

@property (retain) NSArray *data;
@property(weak) id<catagoryTabProtocol> delegate;
//@property (weak,) id<TPNavigationTemplateProtocol>  delegateParentController;

@property(weak, nonatomic) IBOutlet UITableView *infoView;
@property(weak, nonatomic) IBOutlet UITableView *cataView;
@property(strong, nonatomic) IBOutlet TPinfoTypeTableViewController *infoViewController;
@property(strong, nonatomic) IBOutlet TPCataTypeTableViewController *childViewController;

//-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withData:(NSArray *) data delegate:(id<TPNavigationTemplateProtocol> ) delegateController;
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withData:(NSArray *) data withDelegate:(id<catagoryTabProtocol>) tabDelegate;

@end
