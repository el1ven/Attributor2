//
//  ViewController.m
//  Attributor
//
//  Created by el1ven on 14-7-27.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "ViewController.h"
#import "TextStatisticsViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showStats"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatisticsViewController class]]) {
            TextStatisticsViewController *tsvc =(TextStatisticsViewController*)segue.destinationViewController;
            tsvc.textToAnalyze = self.body.textStorage;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //设置outline按钮的基本样式，先获取然后再添加颜色
    NSMutableAttributedString *title =[[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle ];
    [title setAttributes:@{NSStrokeWidthAttributeName:@3, NSStrokeColorAttributeName:self.outlineButton.tintColor} range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self usePreferredFonts];//
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredFontsChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
}

- (void)preferredFontsChanged:(NSNotification*) notification{
    [self usePreferredFonts];
}

- (void)usePreferredFonts{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击按钮文本选中的部分颜色进行改变
- (IBAction)clickToChangeColorWhichSelected:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}

//设置文字边框及描边
- (IBAction)outlineBodySelected:(id)sender {
    [self.body.textStorage addAttributes:@{ NSStrokeWidthAttributeName:@-3,NSStrokeColorAttributeName:[UIColor blackColor]} range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelected:(id)sender {
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];//不用去颜色，因为没有描边就没有颜色，只去一个属性就可以
}



@end
