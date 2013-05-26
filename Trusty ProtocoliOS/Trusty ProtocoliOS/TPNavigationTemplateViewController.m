//
//  TPNavigationTemplateViewController.m
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import "TPNavigationTemplateViewController.h"


#define TPTreeNodeFieldChild @"children"
#define TPTreeNodeFieldChildType @"type"
#define TPTreeNodeFieldChildTypeinfo @"information"
#define TPTreeNodeFieldChildTypeCata @"category"


@interface TPNavigationTemplateViewController (){
    NSMutableArray *catagoryArray;
    NSMutableArray *infoArray;
}

@end

@implementation TPNavigationTemplateViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

//-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withData:(NSArray *) data delegate:(id<TPNavigationTemplateProtocol>)delegateController{

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withData:(NSArray *) data withDelegate:(id<catagoryTabProtocol>)tabDelegate{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.data = data;
        self.delegate = tabDelegate;
        int numOfinfoCell = 0;
        int numOfCatagoryCell   = 0;
        
        
        catagoryArray = [[NSMutableArray  alloc] init];
        infoArray = [[NSMutableArray  alloc] init];
        
        for (NSDictionary *temp in data) {
            
            if ( [TPTreeNodeFieldChildTypeCata isEqualToString: [temp objectForKey:TPTreeNodeFieldChildType]]) {
                numOfCatagoryCell += 1;
                [catagoryArray addObject:temp];
            }
            else if( [TPTreeNodeFieldChildTypeinfo isEqualToString: [temp objectForKey:TPTreeNodeFieldChildType]]){
                numOfinfoCell += 1;
                [infoArray addObject:temp];
            }
        }
        
        

        NSLog(@"number of data points for catagoryArray: %i", [catagoryArray count]);
        
        NSLog(@"number of infoCell: %i  and cataCell: %i ", numOfinfoCell, numOfCatagoryCell);
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"firstPage Loaded");
    
    [self.childViewController setData:catagoryArray];
    [self.childViewController.internalView reloadData];
    
    
    [self.infoViewController setData:infoArray];
    [self.infoViewController.internalView reloadData];
    
     
    self.childViewController.delegate = self.delegate;
        

        
    
    //[self. reloadData];

   
    
    /*
    if (self.infoViewController.internalView) {
        NSLog(@"has internal View");
    }
    else{
        NSLog(@"no internal View");
    }
    
    if (self.infoViewController) {
        NSLog(@"has infoViewController");
    }
    else{
        NSLog(@"has no infoViewController");
    }
     */
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
