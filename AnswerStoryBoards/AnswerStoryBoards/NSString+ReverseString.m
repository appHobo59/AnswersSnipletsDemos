//
//  NSString+ReverseString.m
//  AnswerStoryBoards
//
//  Created by Wylene Sweeney on 3/4/15.
//  Copyright (c) 2015 techENABLE, Inc. All rights reserved.
//

#import "NSString+ReverseString.h"

@implementation NSString (ReverseString)

-(NSString *) reverseString: (NSString *) originalString{
    
    /*! 
     * @brief 03042015 this implementation reverses the string
     * This category adds a reverse string method to NSString
     */
    
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:originalString.length];
    
    [originalString enumerateSubstringsInRange:NSMakeRange(0, originalString.length) options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences) usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reversedString appendString:substring];
    }];
    
    return reversedString;
}

@end
