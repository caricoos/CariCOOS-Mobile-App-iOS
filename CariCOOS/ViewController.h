//
//  ViewController.h
//  CariCOOS
//
//  Created by Pedro Correa on 10/11/14.
//  Copyright (c) 2014 CariCOOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>


@interface ViewController : UIViewController <GMSMapViewDelegate>

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;

@end

