//
//  Common.h
//  MemoryLeaks
//
//  Created by alicia on 8/29/16.
//  Copyright © 2016 LeafTeam. All rights reserved.
//

#ifndef Common_h
#define Common_h


#endif /* Common_h */

#ifdef DEBUG
#define DLog(args, ...) NSLog((@"%s - [Line %d] -- " args), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif