//
//  ViewController.m
//  BillSplitter
//
//  Created by Oliver Andrews on 2015-05-16.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic) NSDecimalNumber *splitBill;
@property (nonatomic) NSDecimalNumber *bill;
@property (nonatomic) NSDecimalNumber *payeeCount;
@property (nonatomic) NSNumberFormatter *formatter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textField.delegate = self;
    [self.slider addTarget:self action:@selector(moveSlider:) forControlEvents:UIControlEventValueChanged];
    self.formatter = [[NSNumberFormatter alloc]init];
//    [self.formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resoufrces that can be recreated.
}
- (IBAction)button:(id)sender {
    [self.textField resignFirstResponder];
    
    self.bill = [NSDecimalNumber decimalNumberWithString:self.textField.text];
    self.splitBill = [self.bill decimalNumberByDividingBy:self.payeeCount];
    
    self.label.text = [self.splitBill stringValue];
    
    self.label.text = [NSNumberFormatter ]
}
- (IBAction)moveSlider:(UISlider *)sender {
    self.payeeCount = [[NSDecimalNumber alloc]initWithFloat:sender.value];
}

@end
