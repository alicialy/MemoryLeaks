//
//  LeaksTableViewController.m
//  MemoryLeaks
//
//  Created by alicia on 8/29/16.
//  Copyright © 2016 LeafTeam. All rights reserved.
//

#import "LeaksTableViewController.h"

static NSString * const kLeaksCellId = @"LeaksCell";

@interface LeaksTableViewController ()

@property (strong, nonatomic) NSArray *leaksArray;
@property (strong, nonatomic) NSArray *segueArray;

@end

@implementation LeaksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return self.leaksArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kLeaksCellId forIndexPath:indexPath];
    
    cell.textLabel.text = self.leaksArray[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *segue = self.segueArray[indexPath.row];
    [self performSegueWithIdentifier:segue sender:self];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - Getter and Setter
- (NSArray *)leaksArray {
    if (_leaksArray) {
        return _leaksArray;
    }
    
    _leaksArray = @[@"Retain Cycle", @"GCD Timer"];
    return _leaksArray;
}

- (NSArray *)segueArray {
    if (_segueArray) {
        return _segueArray;
    }
    
    _segueArray = @[@"RetainCycleSegue", @"GCDTimerSegue"];
    return _segueArray;
}

@end
