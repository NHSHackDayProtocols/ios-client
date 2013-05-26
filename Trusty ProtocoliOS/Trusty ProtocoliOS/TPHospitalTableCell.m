//
//  TPHospitalTableCell.m
//  Trusty ProtocoliOS
//
//  Created by superCat on 25/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import "TPHospitalTableCell.h"

@interface TPHospitalTableCell(){    
CGPoint location;
}

@end

@implementation TPHospitalTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) setHospitalLocationLong:(CGPoint) longAndLatitude Name:(NSString*)name{
    location = longAndLatitude;
    self.hospitalName.text = name;
}
@end
