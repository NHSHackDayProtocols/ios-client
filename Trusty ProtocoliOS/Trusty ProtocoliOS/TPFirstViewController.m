//
//  TPFirstViewController.m
//  Trusty ProtocoliOS
//
//  Created by superCat on 25/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import "TPFirstViewController.h"
#import "TPHospitalTableCell.h"
#import "TPDataSource.h"

#import "TPNavigationTemplateViewController.h"
#import "NSString+URLEncoding.h"

#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "AFJSONRequestOperation.h"

#define TPHospitalListMaxAllow 20

@interface TPFirstViewController ()

@end

@implementation TPFirstViewController

#pragma -
#pragma Init Method and View Control

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)showLocalListButtonClicked:(id)sender{
    
    [self.hospitalTableView reloadData];
    
}

-(IBAction)showNearListButtonClicked:(id)sender{
    
    // someone do this...
}

-(void)clearAllsubControllerOfNavigationController{
    
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        [self.navigationController.view removeFromSuperview];
    }
    
}

#pragma -
#pragma catagoryTab Protocol
-(void) pushNextStackWithData:(NSArray *)data{
    
    if (self.navigationController) {
       
        NSString *templateControllerName = nil;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            templateControllerName = @"navigationViewTemplate_iPhone";
        }
        else{
            templateControllerName = @"navigationViewTemplate_iPad";
        }
        
        TPNavigationTemplateViewController *nextController = [[TPNavigationTemplateViewController alloc] initWithNibName:templateControllerName bundle:[NSBundle mainBundle] withData:data withDelegate:self];
        
        [self.navigationController pushViewController:nextController animated:YES];
    }
    
}

#pragma -
#pragma UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   int fullListCount = [[TPDataSource sharedDataSource].hospitalFullList count];
    
    return (fullListCount <TPHospitalListMaxAllow) ? fullListCount : TPHospitalListMaxAllow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"begin loading data cells");
    
    static NSString *CellIdentifier = @"hospitalCellID";
    NSString *nibName = nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        nibName = @"TPHospitalCell_iPhone";
    }
    else{
        
        nibName = @"TPHospitalCell_iPad";
    }
    
    NSLog(@"nibName is: %@", nibName);
    
    TPHospitalTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        NSLog(@"cell is nil, loading from nibFile");
        NSArray *arrayObj = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
        if (arrayObj) {
            //extract the dataCell of type TPHospitalCell
            for (id currentObj in arrayObj) {
                if ([currentObj  isKindOfClass:[TPHospitalTableCell  class]] ) {
                    cell = (TPHospitalTableCell  *)currentObj;
                }
            }
        }
        else{
            NSLog(@"array is nil");
        }
    }
    
    
    if (cell && [[TPDataSource sharedDataSource].hospitalFullList count] >0) {
        NSDictionary* cellDic  =  (NSDictionary*)[[TPDataSource sharedDataSource].hospitalFullList objectAtIndex:indexPath.row];
        if (cellDic ) {
        CGPoint location=  CGPointMake([[cellDic objectForKey:TPHospitalFieldLatitude] floatValue], [[cellDic objectForKey:TPHospitalFieldLongtitude] floatValue]);
        [cell setHospitalLocationLong: location Name: [cellDic objectForKey:TPHospitalFieldName]];
        }
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.navigationController) {
        NSLog(@"has navigation controller");
        //[[self.navigationController viewControllers] objectAtIndex:0];

    }
    else{
        NSLog(@"no navigation controller");
    }
    
    

    //UIViewController *topController = (UIViewController*)[[self.navigationController viewControllers] objectAtIndex:0];
   // [self.view addSubview: topController.view];
    [self addChildViewController:self.navigationController];
    [self.view addSubview: self.navigationController.view];
    
 

    
    TPHospitalTableCell  *cell = (TPHospitalTableCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *currentName =  cell.hospitalName.text;
    
   // NSString *fullString =  [NSString stringWithFormat: @"corbett.li:4000/services/getHospitalProtocols/%@",currentName];
    NSString *converted = [currentName urlEncodeUsingEncoding:NSUTF8StringEncoding] ;
   // NSLog(@"fullString is: %@  ", converted );
    NSString *fullString =  [NSString stringWithFormat: @"http://corbett.li:4000/services/getHospitalProtocols/%@",converted];
    NSLog(@"fullString is: %@  ", fullString );
    NSURL *tempUrl = [NSURL URLWithString:fullString];
    
   NSURLRequest *hosptialListRequest = [NSURLRequest requestWithURL: tempUrl];

    
    AFJSONRequestOperation *operationHosListDecode = [AFJSONRequestOperation
                                                      JSONRequestOperationWithRequest:hosptialListRequest success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                          
                                                          NSLog(@"request good with single HospitalCell");
                                                          if ([JSON isKindOfClass:[NSArray class]] ) {
                                                           
                                                              //self.navigationController.view.alpha = 1;
                                                              
                                                              [self pushNextStackWithData:JSON];
                                                              
                                                          }
                                                          
                                                      } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                          
                                                          NSLog(@"error for the tree: %@", error.localizedDescription);
                                                      }];
    
      [operationHosListDecode start];

    
    
 /*
    TPNavigationTemplateViewController *nextController = [[TPNavigationTemplateViewController alloc] initWithNibName:templateControllerName bundle:[NSBundle mainBundle] withData:nil delegate:nil];
    
    [self.navigationController pushViewController:nextController animated:YES];
    
*/
    
}

#pragma -
#pragma UITableViewDelegate Protocol
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}

@end
