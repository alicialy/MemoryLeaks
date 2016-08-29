//
//  RetainCyleViewController.m
//  MemoryLeaks
//
//  Created by alicia on 8/29/16.
//  Copyright © 2016 LeafTeam. All rights reserved.
//

#import "RetainCyleViewController.h"
#import "RetainCycleModel.h"
#import "Common.h"

@interface RetainCyleViewController ()

@end

@implementation RetainCyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setRetainCycle];
}

- (void)dealloc {
    DLog(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)p_setRetainCycle {
    RetainCycleModel *model1 = [[RetainCycleModel alloc] init];
    RetainCycleModel *model2 = [[RetainCycleModel alloc] init];
    
    [model1 setObj:model2];
    [model2 setObj:model1];
}

@end
