//
//  WikiSearchObject.h
//  WikipediaSearch
//
//  Created by Craig on 5/16/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WikiSearchObject : NSObject


@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *snippet;

+ (WikiSearchObject *)WikiSearchObjectWithTitle:(NSString *)title andSnippet:(NSString *)snippet;


@end
