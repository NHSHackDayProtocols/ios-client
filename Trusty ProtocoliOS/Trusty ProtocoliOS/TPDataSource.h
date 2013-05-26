//
//  TPDataSource.h
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TPHospitalFieldName @"name"
#define TPHospitalFieldLongtitude @"lng"
#define TPHospitalFieldLatitude @"lat"

@interface TPDataSource : NSObject

//@property(retain) NSMutableDictionary *dataAboutHospital;

//field @  @  @
@property(retain) NSArray *hospitalFullList;
@property(retain) NSArray *hospitalFullListSortedNear;

+(TPDataSource*) sharedDataSource;

-(NSArray*) getHospitalListWithCapacity:(int)numOfHospitals;
-(NSDictionary*) getDataWithHospitalName:(NSString*) name;

@end
