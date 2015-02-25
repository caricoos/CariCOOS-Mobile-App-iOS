//
//  InfoTableViewController.h
//  CariCOOS
//
//  Created by Pedro Correa on 10/14/14.
//  Copyright (c) 2014 CariCOOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface InfoTableViewController : UITableViewController <UITableViewDelegate, GMSMapViewDelegate>

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;

@property (strong, nonatomic) IBOutlet UILabel *Name;

@property (strong, nonatomic) IBOutlet UILabel *Date;
@property (strong, nonatomic) IBOutlet UILabel *Time;
@property (strong, nonatomic) IBOutlet UIImageView *Image;
@property (strong, nonatomic) IBOutlet UILabel *WWC;

// Wave
@property (strong, nonatomic) IBOutlet UIImageView *image_Wave;
@property (strong, nonatomic) IBOutlet UILabel *Height;

@property (strong, nonatomic) IBOutlet UILabel *Period;
@property (strong, nonatomic) IBOutlet UILabel *Direction;
@property (strong, nonatomic) NSString *b_height;
@property (strong, nonatomic) NSString *b_period;
@property (strong, nonatomic) NSString *b_direction;
@property float b_angle;

@property (strong, nonatomic) IBOutlet UIImageView *Angle;


// end Wave

//Current
@property (strong, nonatomic) IBOutlet UIImageView *Image_curr;
@property (strong, nonatomic) IBOutlet UILabel *Current_spd;
@property (strong, nonatomic) IBOutlet UILabel *Current_dicc;

@property (strong, nonatomic) NSString *b_curr_spd;
@property (strong, nonatomic) NSString *b_curr_str;
@property float b_curr_dic;



//end Current

//Wind
@property (strong, nonatomic) IBOutlet UILabel *wind_speed;
@property (strong, nonatomic) IBOutlet UILabel *wind_gust;
@property (strong, nonatomic) IBOutlet UILabel *wind_dic;
//@property (strong, nonatomic) IBOutlet UILabel *air_temp;

@property (strong, nonatomic)  NSString *b_wind_speed;
@property (strong, nonatomic)  NSString *b_wind_gust;
@property (strong, nonatomic)  NSString *b_wind_dic;
@property (strong, nonatomic)  NSString *b_air_temp;

@property (strong, nonatomic) IBOutlet UIImageView *Image_wind;

@property float b_wind_angle;


//End Wind

@property (strong, nonatomic) NSString *b_lat;
@property (strong, nonatomic) NSString *b_long;

@property (strong, nonatomic) NSString *b_name;
@property (strong, nonatomic) NSString *b_type;
@property (strong, nonatomic) NSString *b_date;
@property (strong, nonatomic) NSString *b_time;
@property (strong, nonatomic) NSString *b_image;
@property (strong, nonatomic) NSString *b_wwc;
@end
