//
//  TextStatisticsViewController.h
//  Attributor
//
//  Created by el1ven on 14-7-30.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <UIKit/UIKit.h>
//统计功能
@interface TextStatisticsViewController : UIViewController

@property (nonatomic,strong)NSAttributedString *textToAnalyze;
//当文本被赋值到这个属性上，我们就可以调用函数进行统计分析

@property (weak, nonatomic) IBOutlet UILabel *colorCharacterLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharacterLabel;
@end
