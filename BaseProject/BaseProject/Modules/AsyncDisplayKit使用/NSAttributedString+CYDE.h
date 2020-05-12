//
//  NSAttributedString+CYDE.h
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (CYDE)
+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                          fontSize:(CGFloat)size
                                             color:(UIColor *)color
                                          lineSpac:(CGFloat)lineSpce
                                     textAlignment:(NSTextAlignment)textAlignment;
+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                          fontSize:(CGFloat)size
                                             color:(nullable UIColor *)color
                                    firstWordColor:(nullable UIColor *)firstWordColor;
@end
