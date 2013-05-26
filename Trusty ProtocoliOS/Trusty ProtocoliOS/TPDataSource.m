//
//  TPDataSource.m
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import "TPDataSource.h"

#import "Reachability.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"


#define TPHospitalListURL  @"http://corbett.li:4000/services/hospitalList"





static TPDataSource *source;

@implementation TPDataSource

-(id) init{
    if (self = [super init]) {
        
        
        NSURL *hospitalListUrl = [NSURL URLWithString:TPHospitalListURL];
        NSURLRequest *hosptialListRequest = [NSURLRequest requestWithURL:hospitalListUrl];
        
        AFJSONRequestOperation *operationHosListDecode = [AFJSONRequestOperation
                                                          JSONRequestOperationWithRequest:hosptialListRequest
                                                          success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                              
                                                              NSLog(@"request good");
                                                              if ([JSON isKindOfClass:[NSArray class]] ) {
                                                                  if (!self.hospitalFullList) {
                                                                      self.hospitalFullList =  JSON;
                                                                      self.hospitalFullListSortedNear = [self sortLocationNear:JSON];
                                                                  }
                                                                  
                                                              }
                                                              
                                                              
                                                          } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                              NSLog(@"error: %@", error.localizedDescription);
                                                              
                                                          }];
        
        [operationHosListDecode start];
        
        
    }
    return self;
    
}


+(TPDataSource*) sharedDataSource{
    
    if (!source) {
        source = [[TPDataSource alloc] init];
    }
    return source;
}

-(NSArray*) getHospitalListWithCapacity:(int)numOfHospitals{
    
    if (self.hospitalFullList) {
        NSMutableArray *listWithCap =  [[NSMutableArray alloc] init];
        
        for (int i = 0; i<=numOfHospitals; i++) {
            [listWithCap addObject:[self.hospitalFullList objectAtIndex:i]];
        }
        
        return listWithCap;
    }
    else{
        return nil;
    }
    
    
}


-(NSArray*) sortLocationNear:(NSArray*) list{
    NSArray *copyList = [list copy];
    NSMutableArray *newArray =  [[NSMutableArray alloc] init];
    
   // for (NSDictionary  in <#collection#>) {
   //     <#statements#>
   // }
    

    return  newArray;
}

-(NSDictionary*) getDataWithHospitalName:(NSString*) name{
    
    NSURL *hospitalListUrl = [NSURL URLWithString:TPHospitalListURL];
    NSURLRequest *hosptialListRequest = [NSURLRequest requestWithURL:hospitalListUrl];
    
    AFJSONRequestOperation *operationHosListDecode = [AFJSONRequestOperation
                                                      JSONRequestOperationWithRequest:hosptialListRequest
                                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                          
                                                          NSLog(@"request good");
                                                          if ([JSON isKindOfClass:[NSArray class]] ) {
                                                              if (!self.hospitalFullList) {
                                                                  self.hospitalFullList =  JSON;
                                                                  self.hospitalFullListSortedNear = [self sortLocationNear:JSON];
                                                              }
                                                              
                                                          }
                                                          
                                                          
                                                      } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                          NSLog(@"error: %@", error.localizedDescription);
                                                        
                                                      }];
    
    [operationHosListDecode start];

    
}

@end
