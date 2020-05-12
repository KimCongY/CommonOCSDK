//
//  NSAttributedString+CYDE.m
//  BaseProject
//
//  Created by Chiu Yung on 2018/4/16.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NSAttributedString+CYDE.h"

@implementation NSAttributedString (CYDE)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                          fontSize:(CGFloat)size
                                             color:(nullable UIColor *)color
                                    firstWordColor:(nullable UIColor *)firstWordColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    if (string) {
        NSDictionary *attributes                    = @{NSForegroundColorAttributeName: color ? : [UIColor blackColor],
                                                        NSFontAttributeName: [UIFont systemFontOfSize:size]};
        attributedString = [[NSMutableAttributedString alloc] initWithString:string];
        [attributedString addAttributes:attributes range:NSMakeRange(0, string.length)];
        
        if (firstWordColor) {
            NSRange firstSpaceRange = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
            NSRange firstWordRange  = NSMakeRange(0, firstSpaceRange.location);
            [attributedString addAttribute:NSForegroundColorAttributeName value:firstWordColor range:firstWordRange];
        }
    }
    
    return attributedString;
}

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                          fontSize:(CGFloat)size
                                             color:(UIColor *)color
                                          lineSpac:(CGFloat)lineSpce
                                     textAlignment:(NSTextAlignment)textAlignment{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:[[self class] attributedStringWithString:string fontSize:size color:color firstWordColor:nil]];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:size];
    [paragraphStyle setAlignment:textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    return attributedString;
}
@end
