//
//  TPCataTypeTableViewController.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol catagoryTabProtocol <NSObject>

@required
-(void) pushNextStackWithData:(NSArray *)data;

@end


@interface TPCataTypeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (retain, nonatomic) NSArray *childDetail;


-(void) populateData:(NSDictionary *)data;

@end


@interface TPCataTypeTableViewController : UITableViewController

@property(copy) NSArray *data;
@property (weak) UITableView *internalView;

@property(weak) id<catagoryTabProtocol> delegate;

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
