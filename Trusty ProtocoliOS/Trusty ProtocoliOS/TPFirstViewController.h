//
//  TPFirstViewController.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 25/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPCataTypeTableViewController.h"  // get  stack push protocol

@interface TPFirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate, catagoryTabProtocol>


@property (weak,nonatomic) IBOutlet UITableView *hospitalTableView;
@property (weak, nonatomic) IBOutlet UIButton *showLocalListButton;
@property (strong, nonatomic) IBOutlet UINavigationController *navigationController;


-(IBAction)showLocalListButtonClicked:(id)sender;
-(IBAction)showNearListButtonClicked:(id)sender;

-(void)clearAllsubControllerOfNavigationController;

//catagoryTabProtocol
-(void) pushNextStackWithData:(NSArray *)data;

//UITableViewDataSource protocol
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

//UITableViewDelegate protocol
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

@end
