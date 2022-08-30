//
//  ViewController.m
//  SonicTree
//
//  Created by juliano on 9/6/18.
//  Copyright © 2018 juliano. All rights reserved.
//

#import "ViewController.h"
#import "TreeBrand.h"
#import "YBPopupMenu.h"
#import "Doggy.h"
#import "UIImageView+hello.h"
#import <Foundation/Foundation.h>




@interface ViewController ()<YBPopupMenuDelegate>

@property (weak, nonatomic) IBOutlet UIButton *brandBtn;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSArray *trees;
@property (strong, nonatomic) NSMutableArray *ramTrees;

@property(nonatomic,strong) NSMutableArray *treeBrandArray;

@property(nonatomic,copy) NSMutableArray *abcArray;

@property (weak, nonatomic) IBOutlet UILabel *contextLabel;
@property(nonatomic,strong) TreeBrand *selectTreeBreand;

@property(nonatomic,strong) NSMutableArray *treeBrandTitleArray;
@property(nonatomic,copy) NSString *name;





@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Doggy *dog = [[Doggy alloc] init];
//    self.abcArray = [NSMutableArray array];
//    [_abcArray addObject:[[UIButton alloc]init]];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *trees = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"STreeFile.txt" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
//    NSArray *treeArray = [trees componentsSeparatedByString:@"\n"];
//    NSMutableArray *array = @[].mutableCopy;
//    for (NSString *text in treeArray) {
//        if (text.length >= 4) {
//            NSString *tee = [text substringWithRange:NSMakeRange(2, 3)];
//            [array addObject:tee];
//        }
//    }
//    [array writeToFile:@"/Users/juliano/Desktop/TreeList.plist" atomically:true];
    self.trees = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TreeList.plist" ofType:nil]];
    
    self.treeBrandArray = [NSMutableArray array];
    self.treeBrandTitleArray = [NSMutableArray array];
    NSArray *brandArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cipai.plist" ofType:nil]];
    for (NSDictionary *dict in brandArray) {
        TreeBrand *treeBrand = [TreeBrand treeBrandWithDict:dict];
        [_treeBrandArray addObject:treeBrand];
        [_treeBrandTitleArray addObject:treeBrand.name];

    }
    self.selectTreeBreand = self.treeBrandArray[0];
    [self go:nil];
//    self.view.backgroundColor = [UIColor redColor];
    self.textView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    
    NSString *aa = @"123456";
    __block NSString *b = [aa copy];
    __weak NSString* c = self.name;
    __block int a = 10;
    ^{
        a = 20;
        b = @"333";
        c;
    };
    
//    UIImageView *catImageView = [[UIImageView alloc] init];
//    catImageView.downloadUrl = @"123456";
//    NSLog(@"catImageView.downloadUrl:%@",catImageView.downloadUrl);
    NSLog(@"%ld",(long)[self bigCharacterNum:@"absDDFJjj JJjjM"]);
    
    dispatch_queue_t
    mainQueue = dispatch_get_main_queue();
    
    dispatch_async(mainQueue,^{
        
        NSLog(@"MainQueue");
    });
}
- (IBAction)go:(id)sender {
    self.ramTrees =[NSMutableArray array];
    NSMutableString *texture = [NSMutableString string];
    [texture appendString:@"\n"];
    [texture appendString:@"\n"];
    [texture appendString:@"\n"];
    for (NSInteger i = 0; i < _selectTreeBreand.values.count; i++) {
        NSInteger textNum = [(NSString *)_selectTreeBreand.values[i] integerValue];
//        if (textNum % 2 == 1) {
//            textNum -=1;
//        }
        textNum = textNum / 2;
        [texture appendString:[self textCom:textNum]];
    }
    
//    [texture appendString:[self textCom:3]];
//    [texture appendString:[self textCom:3]];
//    [texture appendString:[self textCom:3]];
//    [texture appendString:[self textCom:1]];
//    [texture appendString:[self textCom:3]];
    
    self.textView.text = texture;
  
    
    
    
}
    
-(NSInteger)bigCharacterNum:(NSString *)str
{
    NSInteger matchedNumber = 0;
    NSLog(@"%@",str);

    for (NSInteger i = 0; i < str.length; i ++)
    {
        char aCharacter = [str characterAtIndex:i];
        if (aCharacter >= 'A' && aCharacter <= 'Z')
        {
            matchedNumber += 1;
        }
    }
    
    NSMutableString *reversedStr = [[NSMutableString alloc] init];
    for (NSInteger i = str.length - 1; i >= 0; i --)
    {
        char aCharacter = [str characterAtIndex:i];
        [reversedStr appendFormat:@"%c",aCharacter];
    }
    NSLog(@"reversedStr:%@",reversedStr);

    return matchedNumber;
}
#pragma mark - data
-(void)setSelectTreeBreand:(TreeBrand *)selectTreeBreand
{
    _selectTreeBreand = selectTreeBreand;
    _brandLabel.text = selectTreeBreand.name;
    _contextLabel.text = selectTreeBreand.context;
    NSString *name = [selectTreeBreand.name substringWithRange:NSMakeRange(2, 1)];
    [_brandBtn setTitle:name forState:UIControlStateNormal];

}
- (IBAction)goSelection:(UIButton *)btn {
    
    [YBPopupMenu showRelyOnView:btn titles:_treeBrandTitleArray icons:nil menuWidth:120 delegate:self];
}

-(NSString *)textCom:(NSInteger )number
{
    
    NSInteger i = 0;
    NSMutableString *texture = [NSMutableString string];
    while (i < number) {
       NSInteger index = arc4random_uniform(self.trees.count);
        NSString *tee = self.trees[index];
        if ([self.ramTrees containsObject:tee] == false) {
            [texture appendString:tee];
            [self.ramTrees addObject:tee];
            i += 1;
        }
    }
    
    [texture appendString:@"\n"];
    return texture;
}

- (IBAction)tapOnView:(UITapGestureRecognizer *)sender {
    [self.view endEditing:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ybPopupMenuDidSelectedAtIndex:(NSInteger)index ybPopupMenu:(YBPopupMenu *)ybPopupMenu
{
    TreeBrand *treeBrand = self.treeBrandArray[index];
    if (treeBrand != self.selectTreeBreand) {
        self.selectTreeBreand = treeBrand;

    }
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
