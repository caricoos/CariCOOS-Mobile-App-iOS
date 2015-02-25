//
//  SwanViewController.h
//  CariCOOS
//
//  Created by Pedro Correa on 2/18/15.
//  Copyright (c) 2015 CariCOOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwanViewController : UIViewController<UIWebViewDelegate>


@property (strong, nonatomic) NSString *s_name;
@property (strong, nonatomic) NSString *s_fancyname;
@property (strong, nonatomic) NSString *s_lat;
@property (strong, nonatomic) NSString *s_lon;
@property (strong, nonatomic) NSString *s_type;


@end
