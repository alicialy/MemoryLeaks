//
//  GCDTimerViewController.m
//  MemoryLeaks
//
//  Created by alicia on 8/29/16.
//  Copyright © 2016 LeafTeam. All rights reserved.
//

#import "GCDTimerViewController.h"
#import "Common.h"

@interface GCDTimerViewController ()

@property(strong, nonatomic)dispatch_source_t timer;

@end

@implementation GCDTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    DLog(@"");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)p_setTimer {
    dispatch_queue_t queue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW,
                              1.0 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(self.timer, ^() {
        // do something
        DLog(@"Run Timer");
        
        #warning dispatch_suspend will cause Leaks
        dispatch_suspend(self.timer);

    });
    dispatch_resume(self.timer);
}

@end
