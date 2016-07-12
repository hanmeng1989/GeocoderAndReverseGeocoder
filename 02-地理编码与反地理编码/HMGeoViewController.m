//
//  ViewController.m
//  02-地理编码与反地理编码
//
//  Created by 韩萌 on 16/7/8.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMGeoViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface HMGeoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addressTextField;

@property (weak, nonatomic) IBOutlet UILabel *longitude;

@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@end

@implementation HMGeoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailLabel.numberOfLines = 0;
}

- (IBAction)geoCoder:(id)sender{

    // 地理编码：向苹果请求数据
    // 1.创建地理编码对象
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    
    // 2.地理编码
    // AddressString需要地理编码的地址
    [geoCoder geocodeAddressString:self.addressTextField.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
            return;
        }
        
        // 实际开发中，通知是给一个列表，让用户自己去选择
        for (CLPlacemark *placemark in placemarks) {
            
            NSLog(@"%@",placemark.locality);
        }
        
        CLPlacemark *placeMark = placemarks.lastObject;
        
        // 经度
        self.longitude.text = [NSString stringWithFormat:@"%f",placeMark.location.coordinate.longitude];
        
        // 纬度
        self.latitude.text = [NSString stringWithFormat:@"%f",placeMark.location.coordinate.latitude];
        
        // 具体位置
        self.detailLabel.text = placeMark.name;
    }];
    
    [self.view endEditing:YES];
}


@end
