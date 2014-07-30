//
//  TextStatisticsViewController.m
//  Attributor
//
//  Created by el1ven on 14-7-30.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "TextStatisticsViewController.h"
//统计功能
@interface TextStatisticsViewController ()

@end

@implementation TextStatisticsViewController

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;//赋值
    if(self.view.window)[self updateUI];//更新UI
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateUI];
}

- (NSAttributedString *)charactersWithAttribute:(NSAttributedString *)attributeName{
    //拷贝带有属性的attribute string
    
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){//如果字符设置了属性
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }else{
            index++;//检查下一个字符
        }
    }
    return characters;
}

- (void)updateUI{
    self.colorCharacterLabel.text = [NSString stringWithFormat:@"%d colorful characters",
                                     [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlineCharacterLabel.text = [NSString stringWithFormat:@"%d outlined characters",
                                       [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
    
    

    
    
}

@end
