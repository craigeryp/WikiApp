//
//  WikiSearchObject.m
//  WikipediaSearch
//
//  Created by Craig on 5/16/13.
//  Copyright (c) 2013 craigeryp. All rights reserved.
//

#import "WikiSearchObject.h"





@implementation WikiSearchObject

//called factory method


+ (WikiSearchObject *)WikiSearchObjectWithTitle:(NSString *)title andSnippet:(NSString *)snippet
{
    
    WikiSearchObject *wikiSearchObject = [[WikiSearchObject alloc]init];
    wikiSearchObject.title = title;
    wikiSearchObject.snippet = snippet;
    
    return wikiSearchObject;
}

@end
