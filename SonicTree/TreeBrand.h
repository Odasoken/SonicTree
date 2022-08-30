//
//  TreeBrand.h
//  SonicTree
//
//  Created by juliano on 9/8/18.
//  Copyright © 2018 juliano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeBrand : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *context;
@property(nonatomic,strong) NSArray *values;

+(instancetype)treeBrandWithDict:(NSDictionary *)dict;
@end
