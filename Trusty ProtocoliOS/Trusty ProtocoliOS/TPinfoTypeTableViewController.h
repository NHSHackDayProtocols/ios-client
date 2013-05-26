//
//  TPinfoTypeTableViewController.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPinfoTypeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webContent;


-(void) populateData:(NSDictionary *)data;

@end

@interface TPinfoTypeTableViewController : UITableViewController

@property (retain) NSArray *data;
@property (weak) UITableView *internalView;

@end
