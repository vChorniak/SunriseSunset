//
//  TableViewController.m
//  SunriseSunset
//
//  Created by user on 27.09.18.
//  Copyright © 2018 Chorniak inc. All rights reserved.
//

#import "TableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "TableViewCell.h"

@interface TableViewController (){
    NSArray* responseSun;
}



@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* urlString = [NSString stringWithFormat:@"https://api.sunrise-sunset.org/json?lat=49.839684&lng=-24.029716&date=today"];
    
    /*
    [self viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) loadSunData {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=today" parameters:nil success:^(NSURLSessionTask *operation, id  responseObject) {
        responseSun = [responseObject valueForKey:@"respons"];
        [self.tableView reloadData];
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *opearation, NSError* error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return responseSun.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray* responesObjectData = responseSun[indexPath.row];
    cell.titleLabel.text = [responesObjectData valueForKey:@"title"];
    
    // Configure the cell...
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
