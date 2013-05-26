//
//  TPinfoTypeTableViewController.m
//  Trusty ProtocoliOS
//
//  Created by superCat on 26/05/2013.
//  Copyright (c) 2013 TrustyProtocol. All rights reserved.
//

#import "TPinfoTypeTableViewController.h"

#define TPinfoTypeName @"title"
#define TPinfoTypeContent @"content"

@implementation TPinfoTypeCell

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


-(void) populateData:(NSDictionary *)data{
    
    self.cellLabel.text =  [data objectForKey:TPinfoTypeName];
    [self.webContent stringByEvaluatingJavaScriptFromString:  [data objectForKey:TPinfoTypeContent] ];
    
    
}



@end



@interface TPinfoTypeTableViewController ()

@end

@implementation TPinfoTypeTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    if (!self.internalView) {
        self.internalView = tableView;
    }
    
    if ([self.data count]) {
        return 1;
    }
    else{
        return 0;
    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (!self.internalView) {
        self.internalView = tableView;
    }
    return [self.data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.internalView) {
        self.internalView = tableView;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return 180;
    }
    else{
        return 300;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.internalView) {
        self.internalView = tableView;
    }
    static NSString *CellIdentifier = @"infoCellID";
    
    NSString *nibName = nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        nibName = @"TPinfoTypeCell_iPhone";
    }
    else{
        
        nibName = @"TPinfoTypeCell_iPad";
    }
    
    NSLog(@"nibName is: %@", nibName);
    
    TPinfoTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        NSLog(@"cell is nil, loading from nibFile");
        NSArray *arrayObj = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
        if (arrayObj) {
            //extract the dataCell of type TPHospitalCell
            for (id currentObj in arrayObj) {
                if ([currentObj  isKindOfClass:[TPinfoTypeCell  class]] ) {
                    cell = (TPinfoTypeCell  *)currentObj;
                }
            }
        }
        else{
            NSLog(@"array is nil");
        }
    }
    
    
    if (cell) {
        [cell populateData:[self.data objectAtIndex:indexPath.row]];
    }
    
    
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
