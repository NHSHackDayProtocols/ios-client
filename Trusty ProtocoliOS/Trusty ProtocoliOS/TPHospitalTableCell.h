//
//  TPHospitalTableCell.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 25/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPHospitalTableCell : UITableViewCell

@property(weak) IBOutlet UILabel *hospitalName;
@property(weak) IBOutlet UIImageView *titleImage;


-(void) setHospitalLocationLong:(CGPoint) longAndLatitude Name:(NSString*)name;

@end
