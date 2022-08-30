//
//  TreeBrand.m
//  SonicTree
//
//  Created by juliano on 9/8/18.
//  Copyright © 2018 juliano. All rights reserved.
//

#import "TreeBrand.h"

@implementation TreeBrand

+(instancetype)treeBrandWithDict:(NSDictionary *)dict
{
    TreeBrand *treeBrand = [[TreeBrand alloc] init];
    treeBrand.name = dict[@"name"];
    treeBrand.context = dict[@"context"];
    NSString *value = dict[@"ryhme"];
    NSArray *values = [value componentsSeparatedByString:@","];
    treeBrand.values = values;
    return treeBrand;
    
}

@end
