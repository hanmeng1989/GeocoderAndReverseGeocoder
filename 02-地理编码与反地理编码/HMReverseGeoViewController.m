//
//  HMGeoViewController.m
//  02-地理编码与反地理编码
//
//  Created by 韩萌 on 16/7/8.
//  Copyright © 2016年 hanmeng. All rights reserved.
//

#import "HMReverseGeoViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface HMReverseGeoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *longitude;

@property (weak, nonatomic) IBOutlet UITextField *latitude;

@property (weak, nonatomic) IBOutlet UILabel *addressLbl;


@end

@implementation HMReverseGeoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.addressLbl.numberOfLines = 0;
}

- (IBAction)reverseGeoCode:(id)sender{

    // 1.创建地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    // 2.反地理编码
    CLLocation *location = [[CLLocation alloc] initWithLatitude:self.latitude.text.doubleValue longitude:self.longitude.text.doubleValue];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        // 防错处理
        if (error) {
            NSLog(@"%@",error);
            return ;
        }
        
        self.addressLbl.text = placemarks.firstObject.name;
    }];
    
    [self.view endEditing:YES];

}

@end
