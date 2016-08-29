//
//  RetainCycleModel.h
//  MemoryLeaks
//
//  Created by alicia on 8/29/16.
//  Copyright © 2016 LeafTeam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RetainCycleModel : NSObject

@property (strong, nonatomic) id obj;
#warning obj should be weak
//@property (weak, nonatomic) id obj;



@end
