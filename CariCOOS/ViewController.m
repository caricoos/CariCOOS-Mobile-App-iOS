//
//  ViewController.m
//  CariCOOS
//
//  Created by Pedro Correa on 10/11/14.
//  Copyright (c) 2014 CariCOOS. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "Reachability.h"
#import "InfoTableViewController.h"
#import "SwanViewController.h"
//#import "AFCSVRequestOperation.h"




@interface ViewController ()


@end


@implementation ViewController{
    
 
   
}

NSURL *url;
NSString *jsonUrlString;
NSURLRequest *request;
NSData *responseData;
NSMutableArray *result;


NSMutableArray *result2;
NSString *name_swan;
NSString *fancyname_swan;
NSString *lat_swan;
NSString *lon_swan;
NSString *type_swan;

NSString *Unique_name;


NSMutableDictionary *dic;
NSString *string;
NSData *data;
NSString *name;
NSString *Lat;
NSString *Long;
NSString *Plat;
NSString *snipp;
NSString *date;
NSString *Time;
NSString *Type;
NSString *height;
NSString *period;
NSString *direction;
float angle;
NSString *current_spd;
float current_dic;
NSString *curr_str;

NSString *wind_speed;
NSString *wind_gust;
NSString *wind_dic;
//NSString *air_temp;

float wind_angle;

- (IBAction)Refresh:(id)sender {
    
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    if(internetStatus == NotReachable) {
        UIAlertView *errorView;
        
        errorView = [[UIAlertView alloc]
                     initWithTitle: NSLocalizedString(@"Network error", @"Network error")
                     message: NSLocalizedString(@"No internet connection found, this application requires an internet connection to gather the data required. Please check your connection and hit the refresh button...", @"Network error")
                     delegate: self
                     cancelButtonTitle: NSLocalizedString(@"Close", @"Network error") otherButtonTitles: nil];
        
        [errorView show];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        return;
    }
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(
                                                       DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        //Load the json on another thread
        
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
        NSHTTPURLResponse *response;
        jsonUrlString = [NSString stringWithFormat:@"http://136.145.249.39/app/elmer/csv/JsonBuoyData.json"];
        url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        //-- Get request and response though URL
        request = [[NSURLRequest alloc]initWithURL:url];
        responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
        
        
        if (responseData != nil){
            
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
        //-- JSON Parsing
        result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"Result = %@",result);
        
        for (dic in result)
        {
            string = dic[@"array"];
            if (string)
            {
                data = [string dataUsingEncoding:NSUTF8StringEncoding];
                dic[@"array"] = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            }
            else
            {
               // NSLog(@"Error in url response");
            }
        }
        
            [self.mapView clear];
            
            for (int i = 0; i < result.count; i++) {
                
                name = [[result objectAtIndex:i] objectForKey:@"name"];
                Lat = [[result objectAtIndex:i] objectForKey:@"latitude"];
                Long = [[result objectAtIndex:i] objectForKey:@"longitude"];
                Plat = [[result objectAtIndex:i] objectForKey:@"plataform"];
                
                snipp = @"Click here for more info";
                
               
                
                
                double latdouble = [Lat doubleValue];
                double longdouble = [Long doubleValue];
                
                
                
                // Creates a marker in San Juan of the map.
                GMSMarker *marker = [[GMSMarker alloc] init];
                marker.position = CLLocationCoordinate2DMake(latdouble,longdouble);
                marker.title = name;
                
                marker.snippet = snipp;
                
                if ([Plat isEqualToString:@"caricoos"] || [name isEqualToString:@"CariCOOS Buoy Rincon"])
                {
                    
                    
                    marker.icon = [UIImage imageNamed:@"CariCOOS"];
                    marker.map = self.mapView;
                }
                
                if ([Plat isEqualToString:@"wflow"] || [Plat isEqualToString:@"ndbc"])
                {
                    marker.icon = [UIImage imageNamed:@"Wind"];
                    marker.map = self.mapView;
                }
                
                
            }
            
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            
            [standardDefaults setObject:@"On" forKey:@"CariCOOS"];
            [standardDefaults setObject:@"On" forKey:@"Wind"];
            
            
            [standardDefaults synchronize];
            
        }
       
    });

    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Navigation and tabbar ******
   
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"title"]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
    
    self.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
    
    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    
    UITabBarItem *tabBarItem = [self.tabBarController.tabBar.items objectAtIndex:0];
    
    UIImage *unselectedImage = [UIImage imageNamed:@"radar_un"];
    UIImage *selectedImage = [UIImage imageNamed:@"radar_se"];
    
    [tabBarItem setImage: [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem setSelectedImage: selectedImage];
    
    
    
    tabBarItem = [self.tabBarController.tabBar.items objectAtIndex:1];
    
    unselectedImage = [UIImage imageNamed:@"map_un"];
    selectedImage = [UIImage imageNamed:@"map_se"];
    
    [tabBarItem setImage: [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem setSelectedImage: selectedImage];
    
    
    
    tabBarItem = [self.tabBarController.tabBar.items objectAtIndex:2];
    
    unselectedImage = [UIImage imageNamed:@"more_un"];
    selectedImage = [UIImage imageNamed:@"more_se"];
    
    [tabBarItem setImage: [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [tabBarItem setSelectedImage: selectedImage];
    

    // end navigation and tabbar ****
    
  
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate 18.450927,-66.109972 at zoom level 7.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.3
                                                            longitude:-65.8
                                                                 zoom:7];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    self.mapView.mapType = kGMSTypeNormal;
    /*
     Normal	kGMSTypeNormal	Typical road map. Roads, some man-made features, and important natural features such as rivers are shown. Road and feature labels are also visible. This is the default map mode in Google Maps for iOS.
     
     Hybrid	kGMSTypeHybrid	Satellite photograph data with road maps added. Road and feature labels are also visible. This map type can be enabled on the Google Maps app for iOS by turning on the Satellite view.
     
     Satellite	kGMSTypeSatellite	Satellite photograph data. Road and feature labels are not visible. This mode is not available in Google Maps for iOS.
     
     Terrain	kGMSTypeTerrain	Topographic data. The map includes colors, contour lines and labels, and perspective shading. Some roads and labels are also visible.
     
     None	kGMSTypeNone	No map tiles. The base map tiles will not be rendered. This mode is useful in conjunction with tile layers. The display of traffic data will be disabled when the map type is set to none.
     */
    
    self.mapView.myLocationEnabled = YES;
    self.mapView.settings.compassButton = YES;
    self.mapView.settings.rotateGestures = NO;
    self.mapView.delegate = self;
    self.view = self.mapView;
    
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];
    
    if(internetStatus == NotReachable) {
        UIAlertView *errorView;
        
        errorView = [[UIAlertView alloc]
                     initWithTitle: NSLocalizedString(@"Network error", @"Network error")
                     message: NSLocalizedString(@"No internet connection found, this application requires an internet connection to gather the data required. Please check your connection and hit the refresh button...", @"Network error")
                     delegate: self
                     cancelButtonTitle: NSLocalizedString(@"Close", @"Network error") otherButtonTitles: nil];
        
        [errorView show];
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        return;
    }

    
    NSHTTPURLResponse *response;
    jsonUrlString = [NSString stringWithFormat:@"http://136.145.249.39/app/elmer/csv/JsonBuoyData.json"];
    url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //-- Get request and response though URL
    request = [[NSURLRequest alloc]initWithURL:url];
    responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    
    if (responseData != nil){
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        //-- JSON Parsing
        result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"Result = %@",result);
        
        for (dic in result)
        {
            string = dic[@"array"];
            if (string)
            {
                data = [string dataUsingEncoding:NSUTF8StringEncoding];
                dic[@"array"] = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            }
            else
            {
                //NSLog(@"Error in url response");
            }
        }
        
        [self.mapView clear];
        
        for (int i = 0; i < result.count; i++) {
            
            name = [[result objectAtIndex:i] objectForKey:@"name"];
            Lat = [[result objectAtIndex:i] objectForKey:@"latitude"];
            Long = [[result objectAtIndex:i] objectForKey:@"longitude"];
            Plat = [[result objectAtIndex:i] objectForKey:@"plataform"];
            
            snipp = @"Click here for more info";
            
           
            
            
            double latdouble = [Lat doubleValue];
            double longdouble = [Long doubleValue];
            
            
            
            // Creates a marker in San Juan of the map.
            GMSMarker *marker = [[GMSMarker alloc] init];
            marker.position = CLLocationCoordinate2DMake(latdouble,longdouble);
            marker.title = name;
            
            marker.snippet = snipp;
            
            if ([Plat isEqualToString:@"caricoos"] || [name isEqualToString:@"CariCOOS Buoy Rincon"])
            {
                
                
                marker.icon = [UIImage imageNamed:@"CariCOOS"];
                marker.map = self.mapView;
            }
            
            if ([Plat isEqualToString:@"wflow"] || [Plat isEqualToString:@"ndbc"])
            {
                marker.icon = [UIImage imageNamed:@"Wind"];
                marker.map = self.mapView;
            }
            
            
        }
        
        NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
        
        [standardDefaults setObject:@"On" forKey:@"CariCOOS"];
        [standardDefaults setObject:@"On" forKey:@"Wind"];
        
        
        [standardDefaults synchronize];
        
    }
    
    
    }



-(void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    

    if([[standardDefaults stringForKey:@"BOOL"]isEqualToString:@"On"]){
    
    if ([[standardDefaults stringForKey:@"PuertoRico"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"USVI"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"SanJuan"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"West"]isEqualToString:@"Off"]){
        
       [standardDefaults setObject:@"On" forKey:@"PuertoRico"];
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.3
                                                                longitude:-65.8
                                                                     zoom:7];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        
        
        self.mapView.settings.rotateGestures = NO;
        self.mapView.delegate = self;
        self.view = self.mapView;
        
        [standardDefaults setObject:@"Off" forKey:@"BOOL"];
        
    }
    
    if ([[standardDefaults stringForKey:@"PuertoRico"]isEqualToString:@"On"]){
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.3
                                                                longitude:-65.8
                                                                     zoom:7];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        
        
        self.mapView.settings.rotateGestures = NO;
        self.mapView.delegate = self;
        self.view = self.mapView;
        
        [standardDefaults setObject:@"Off" forKey:@"BOOL"];
        
    }
    
    if ([[standardDefaults stringForKey:@"USVI"]isEqualToString:@"On"]){
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.105871
                                                                longitude:-65.031073
                                                                     zoom:8.2];
        
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];//18.205871 , -65.131073
        
        
        self.mapView.settings.rotateGestures = NO;
        self.mapView.delegate = self;
        self.view = self.mapView;
        
        [standardDefaults setObject:@"Off" forKey:@"BOOL"];
        
    }
    
    if ([[standardDefaults stringForKey:@"SanJuan"]isEqualToString:@"On"]){
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.461603
                                                                longitude:-66.117525
                                                                     zoom:13];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];//(18.451603 , -66.117525)
        
        
        self.mapView.settings.rotateGestures = NO;
        self.mapView.delegate = self;
        self.view = self.mapView;
        
        [standardDefaults setObject:@"Off" forKey:@"BOOL"];
    }
    
    if ([[standardDefaults stringForKey:@"West"]isEqualToString:@"On"]){
        
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:18.211603
                                                                longitude:-67.089525
                                                                     zoom:9];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];//(18.451603 , -66.117525)
        
        
        self.mapView.settings.rotateGestures = NO;
        self.mapView.delegate = self;
        self.view = self.mapView;
        
        [standardDefaults setObject:@"Off" forKey:@"BOOL"];
    }
    
    }
   
    if([[standardDefaults stringForKey:@"LAYER"]isEqualToString:@"On"])
    {
    
        
    if ([[standardDefaults stringForKey:@"Normal"]isEqualToString:@"On"]){
        
        self.mapView.mapType = kGMSTypeNormal;
        [standardDefaults setObject:@"Off" forKey:@"LAYER"];
    }
    
    if ([[standardDefaults stringForKey:@"Hybrid"]isEqualToString:@"On"]){
        
        self.mapView.mapType = kGMSTypeHybrid;
        [standardDefaults setObject:@"Off" forKey:@"LAYER"];
    }
    
    if ([[standardDefaults stringForKey:@"Satellite"]isEqualToString:@"On"]){
        
        self.mapView.mapType = kGMSTypeSatellite;
        [standardDefaults setObject:@"Off" forKey:@"LAYER"];
    }
    
    if ([[standardDefaults stringForKey:@"Terrain"]isEqualToString:@"On"]){
        
        self.mapView.mapType = kGMSTypeTerrain;
        [standardDefaults setObject:@"Off" forKey:@"LAYER"];
    }
    
    if ([[standardDefaults stringForKey:@"None"]isEqualToString:@"On"]){
        
        self.mapView.mapType = kGMSTypeNone;
        [standardDefaults setObject:@"Off" forKey:@"LAYER"];
    }
    
    }
    
    if (responseData != nil){
    
        
    if ([[standardDefaults stringForKey:@"CariCOOS"]isEqualToString:@"On"] && [[standardDefaults stringForKey:@"Wind"]isEqualToString:@"On"] ){
      
        [self.mapView clear];
        
        for (int i = 0; i < result.count; i++) {
            
            name = [[result objectAtIndex:i] objectForKey:@"name"];
            Lat = [[result objectAtIndex:i] objectForKey:@"latitude"];
            Long = [[result objectAtIndex:i] objectForKey:@"longitude"];
            Plat = [[result objectAtIndex:i] objectForKey:@"plataform"];
            
            snipp = @"Click here for more info";
            
            
            
            
            double latdouble = [Lat doubleValue];
            double longdouble = [Long doubleValue];
            
            
                
                // Creates a marker in San Juan of the map.
                GMSMarker *marker = [[GMSMarker alloc] init];
                marker.position = CLLocationCoordinate2DMake(latdouble,longdouble);
                marker.title = name;
            
                marker.snippet = snipp;
            
            if ([Plat isEqualToString:@"caricoos"] || [name isEqualToString:@"CariCOOS Buoy Rincon"])
            {
            
                
                marker.icon = [UIImage imageNamed:@"CariCOOS"];
                marker.map = self.mapView;
            }
            
            if ([Plat isEqualToString:@"wflow"] || [Plat isEqualToString:@"ndbc"])
            {
                marker.icon = [UIImage imageNamed:@"Wind2"];
                marker.map = self.mapView;
            }
            
            
        }

        
    }
    if ([[standardDefaults stringForKey:@"CariCOOS"]isEqualToString:@"On"] && [[standardDefaults stringForKey:@"Wind"]isEqualToString:@"Off"] ){
        
        [self.mapView clear];
        
        for (int i = 0; i < result.count; i++) {
            
            name = [[result objectAtIndex:i] objectForKey:@"name"];
            Lat = [[result objectAtIndex:i] objectForKey:@"latitude"];
            Long = [[result objectAtIndex:i] objectForKey:@"longitude"];
            Plat = [[result objectAtIndex:i] objectForKey:@"plataform"];
            
            snipp = @"Click here for more info";
            
           
            
            double latdouble = [Lat doubleValue];
            double longdouble = [Long doubleValue];
            
            if ([Plat isEqualToString:@"caricoos"] || [name isEqualToString:@"CariCOOS Buoy Rincon"])
                
            {
                
                // Creates a marker in San Juan of the map.
                GMSMarker *marker = [[GMSMarker alloc] init];
                marker.position = CLLocationCoordinate2DMake(latdouble,longdouble);
                marker.title = name;
                marker.snippet = snipp;
                
                marker.icon = [UIImage imageNamed:@"CariCOOS"];
                marker.map = self.mapView;
            }
            
            
        }
        

        
    }
    if ([[standardDefaults stringForKey:@"CariCOOS"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"Wind"]isEqualToString:@"On"] ){
        
        [self.mapView clear];
        
        for (int i = 0; i < result.count; i++) {
            
            name = [[result objectAtIndex:i] objectForKey:@"name"];
            Lat = [[result objectAtIndex:i] objectForKey:@"latitude"];
            Long = [[result objectAtIndex:i] objectForKey:@"longitude"];
            Plat = [[result objectAtIndex:i] objectForKey:@"plataform"];
            
            snipp = @"Click here for more info";
            
           
            
            double latdouble = [Lat doubleValue];
            double longdouble = [Long doubleValue];
            
            GMSMarker *marker = [[GMSMarker alloc] init];
            marker.position = CLLocationCoordinate2DMake(latdouble,longdouble);
            marker.title = name;
            marker.snippet = snipp;
            
            if ([Plat isEqualToString:@"wflow"] || [Plat isEqualToString:@"ndbc"])
                
            {
                
                // Creates a marker in San Juan of the map.
                
                //Marker Icon image
                marker.icon = [UIImage imageNamed:@"Wind"];
                marker.map = self.mapView;
            }
            
            
            
        }
        

        
        
    }
    if ([[standardDefaults stringForKey:@"CariCOOS"]isEqualToString:@"Off"] && [[standardDefaults stringForKey:@"Wind"]isEqualToString:@"Off"]  ){
      
        [self.mapView clear];
        
    }
        
        if ([[standardDefaults stringForKey:@"Swan"]isEqualToString:@"On"]){
            
            //Swan
            
            
            
            NSHTTPURLResponse *response;
            jsonUrlString = [NSString stringWithFormat:@"http://caricoos.org/Swan.json"];
            url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            //-- Get request and response though URL
            request = [[NSURLRequest alloc]initWithURL:url];
            responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            //-- JSON Parsing
            result2 = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
            //NSLog(@"Result = %@",result2);
            
            for (dic in result)
            {
                string = dic[@"array"];
                if (string)
                {
                    data = [string dataUsingEncoding:NSUTF8StringEncoding];
                    dic[@"array"] = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                }
                else
                {
                    //NSLog(@"Error in url response");
                }
            }
            
            
            
            for (int i = 0; i < result2.count; i++) {
                
                name_swan = [[result2 objectAtIndex:i] objectForKey:@"NAME"];
                fancyname_swan = [[result2 objectAtIndex:i] objectForKey:@"FANCYNAME"];
                lat_swan = [[result2 objectAtIndex:i] objectForKey:@"LAT"];
                lon_swan = [[result2 objectAtIndex:i] objectForKey:@"LON"];
                type_swan = [[result2 objectAtIndex:i] objectForKey:@"TYPE"];
                
                snipp = @"Click here for more info";
                
                
                
                Unique_name = [fancyname_swan stringByAppendingString:@" Forecast"];
                
                double latdouble = [lat_swan doubleValue]+ 0.0001;
                double longdouble = [lon_swan doubleValue];
                
                
                
                // Creates a marker in San Juan of the map.
                GMSMarker *marker = [[GMSMarker alloc] init];
                marker.position = CLLocationCoordinate2DMake(latdouble,longdouble);
                marker.title = Unique_name;
                
                marker.snippet = snipp;
                marker.icon = [UIImage imageNamed:@"swan"];
                marker.map = self.mapView;
                
                
                
            }
            
            NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
            
            [standardDefaults setObject:@"On" forKey:@"Swan"];
            
            
            
            [standardDefaults synchronize];
            
            
            
            
            
        }

     
        
    }//else of response == nill
    
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    
    for (int i = 0; i < result.count; i++) {
        
        name = [[result objectAtIndex:i] objectForKey:@"name"];
        Lat = [[result objectAtIndex:i] objectForKey:@"latitude"];
        Long = [[result objectAtIndex:i] objectForKey:@"longitude"];
        Plat = [[result objectAtIndex:i] objectForKey:@"plataform"];
        date = [[result objectAtIndex:i] objectForKey:@"date"];
        Time = [[result objectAtIndex:i] objectForKey:@"time"];
        Type = [[result objectAtIndex:i] objectForKey:@"type"];
        height = [[result objectAtIndex:i] objectForKey:@"Significant Wave Height (0m)"];
        period = [[result objectAtIndex:i] objectForKey:@"Dominant Wave Period (0m)"];
        direction = [[result objectAtIndex:i] objectForKey:@"Mean Wave Direction (0m)"];
        
        wind_speed = [[result objectAtIndex:i] objectForKey:@"Wind Speed (-4m)"];
        wind_gust = [[result objectAtIndex:i] objectForKey:@"Wind Gust (-4m)"];
        wind_dic = [[result objectAtIndex:i] objectForKey:@"Wind Direction (-4m)"];
        //air_temp = [[result objectAtIndex:i] objectForKey:@"Mean Wave Direction (0m)"];
        
        float h = [height floatValue];
        
        h = h * 3.281;
        
        height = [NSString stringWithFormat:@"%.1f", h];
        
       
        
        angle = [direction floatValue];
        
        current_spd = [[result objectAtIndex:i] objectForKey:@"Current Speed (2m)"];
        
        curr_str = [[result objectAtIndex:i] objectForKey:@"Current Direction (2m)"];
        
        current_dic = [curr_str floatValue];
        

        wind_angle = [wind_dic floatValue];

        if([name isEqualToString:marker.title]){
            
            [self performSegueWithIdentifier:@"info" sender:self];
            
            return;
        }
       
        
        
    }
    
    for (int i = 0; i < result2.count; i++) {
        
        name_swan = [[result2 objectAtIndex:i] objectForKey:@"NAME"];
        fancyname_swan = [[result2 objectAtIndex:i] objectForKey:@"FANCYNAME"];
        lat_swan = [[result2 objectAtIndex:i] objectForKey:@"LAT"];
        lon_swan = [[result2 objectAtIndex:i] objectForKey:@"LON"];
        type_swan = [[result2 objectAtIndex:i] objectForKey:@"TYPE"];
        
        Unique_name = [fancyname_swan stringByAppendingString:@" Forecast"];
      
        
        if([Unique_name isEqualToString:marker.title]){
            
            [self performSegueWithIdentifier:@"info2" sender:self];
            
            return;
        }
        
        
        
    }

    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"info"])
    {
       InfoTableViewController *controller = (InfoTableViewController *)segue.destinationViewController;
        controller.b_name = name;
        controller.b_type = Type;
    
        controller.b_date = date;
        controller.b_time = Time;
        
        controller.b_height = height;
        controller.b_period = period;
        controller.b_direction = direction;
        controller.b_lat = Lat;
        controller.b_long = Long;
        
        
        
        if ([Plat isEqualToString:@"wflow"] || [Plat isEqualToString:@"ndbc"])
            
        {
            controller.b_image = @"Wind";
            controller.b_wwc = @"Wind";
            
            height = [@"Wind Height: " stringByAppendingString:@"N/A"];
            period = [@"Wind Period: " stringByAppendingString:@"N/A"];
            direction = [@"Wind Angle: " stringByAppendingString:@"N/A"];
            
            
            controller.b_height = height;
            controller.b_period = period;
            controller.b_direction = direction;
            
            current_spd = [@"Current Speed: " stringByAppendingString:@"N/A"];
            curr_str = [@"Current Direction: " stringByAppendingString:@"N/A"];
            
            controller.b_curr_spd = current_spd;
            controller.b_curr_str = curr_str;
            
            float f = [wind_speed floatValue];
            
            f = round(f);
            
            wind_speed = [NSString stringWithFormat:@"%.f", f];
            
            
            
            f = [wind_gust floatValue];
            
            f = round(f);
            
            wind_gust = [NSString stringWithFormat:@"%.f", f];
            
            
            f = [wind_dic floatValue];
            
            wind_dic = [NSString stringWithFormat:@"%.f", f];
            
            //air_temp = [direction substringToIndex:4];
            
            wind_speed = [wind_speed stringByAppendingString:@" Kts"];
            wind_gust = [wind_gust stringByAppendingString:@" Kts"];
            wind_dic = [wind_dic stringByAppendingString:@"°"];
            //air_temp = [air_temp stringByAppendingString:@"°C"];
            
            wind_speed = [@"Wind Speed: " stringByAppendingString:wind_speed];
            wind_gust = [@"Wind Gust: " stringByAppendingString:wind_gust];
            wind_dic = [@"Wind Direction: " stringByAppendingString:wind_dic];
            //air_temp = [@"Temp: " stringByAppendingString:air_temp];
            
            controller.b_wind_speed = wind_speed;
            controller.b_wind_gust = wind_gust;
            controller.b_wind_dic = wind_dic;
            controller.b_wind_angle = wind_angle;
            
            
        }
        if ([Plat isEqualToString:@"caricoos"] || [name isEqualToString:@"CariCOOS Buoy Rincon"])
        {
            if ([name isEqualToString:@"CariCOOS Buoy Rincon"]){
            current_spd = [@"Current Speed: " stringByAppendingString:@"N/A"];
            curr_str = [@"Current Direction: " stringByAppendingString:@"N/A"];
            
            controller.b_curr_spd = current_spd;
            controller.b_curr_str = curr_str;
                
            wind_speed = [@"Wind Speed: " stringByAppendingString:@"N/A"];
            wind_gust= [@"Wind Gust: " stringByAppendingString:@"N/A"];
            wind_dic = [@"Wind Direction: " stringByAppendingString:@"N/A"];
            //air_temp = [@"Temp: " stringByAppendingString:@"N/A"];
                
            controller.b_wind_speed = wind_speed;
            controller.b_wind_gust = wind_gust;
            controller.b_wind_dic = wind_dic;
            controller.b_wind_angle = wind_angle;
                
                
                controller.b_wwc = @"Wave";
            }
            controller.b_image = @"CariCOOS";
            
            if([Plat isEqualToString:@"caricoos"]){
            controller.b_wwc = @"Wave, Wind & Current";
            }
            
            float f = [height floatValue];
            
            
            f = round(f);
            
           
        
            height = [NSString stringWithFormat:@"%.f", f];
            
            
            f = [period floatValue];
            
            
            f = round(f);
            
            period = [NSString stringWithFormat:@"%.f", f];
        
            
            f = [direction floatValue];
            
            direction = [NSString stringWithFormat:@"%.f", f];
            
            
            height = [height stringByAppendingString:@" ft"];
            period = [period stringByAppendingString:@" s"];
            direction = [direction stringByAppendingString:@"°"];
            
            height = [@"Significant Wave Height: " stringByAppendingString:height];
            period = [@"Dominant Wave Period: " stringByAppendingString:period];
            direction = [@"Mean Wave Direction: " stringByAppendingString:direction];
            
            controller.b_height = height;
            controller.b_period = period;
            controller.b_direction = direction;
            controller.b_angle = angle;
            
            f = [current_spd floatValue];
            
            current_spd = [NSString stringWithFormat:@"%.2f", f];
            
            
            f = [curr_str floatValue];
            
            curr_str = [NSString stringWithFormat:@"%.f", f];
            
            
            current_spd = [current_spd stringByAppendingString:@" Kts"];
            curr_str = [curr_str stringByAppendingString:@"°"];
            
            
            current_spd = [@"Current Speed: " stringByAppendingString:current_spd];
            curr_str = [@"Current Direction: " stringByAppendingString:curr_str];
            
            controller.b_curr_dic = current_dic;
            controller.b_curr_str = curr_str;
            controller.b_curr_spd = current_spd;
            
            
            //Wind
            
            wind_speed = [wind_speed substringToIndex:4];
            wind_gust = [wind_gust substringToIndex:4];
            wind_dic = [wind_dic substringToIndex:4];
            //air_temp = [direction substringToIndex:4];
            
             f = [wind_speed floatValue];
            
            f = round(f);
            
            wind_speed = [NSString stringWithFormat:@"%.f", f];
            
            
            f = [wind_gust floatValue];
            
            f = round(f);
            
            wind_gust = [NSString stringWithFormat:@"%.f", f];
            
            
            f = [wind_dic floatValue];
            
            wind_dic = [NSString stringWithFormat:@"%.f", f];
            
            wind_speed = [wind_speed stringByAppendingString:@" Kts"];
            wind_gust = [wind_gust stringByAppendingString:@" Kts"];
            wind_dic = [wind_dic stringByAppendingString:@"°"];
            //air_temp = [air_temp stringByAppendingString:@"°C"];
            
            wind_speed = [@"Wind Speed: " stringByAppendingString:wind_speed];
            wind_gust = [@"Wind Gust: " stringByAppendingString:wind_gust];
            wind_dic = [@"Wind Direction: " stringByAppendingString:wind_dic];
            //air_temp = [@"Temp: " stringByAppendingString:air_temp];
            
            controller.b_wind_speed = wind_speed;
            controller.b_wind_gust = wind_gust;
            controller.b_wind_dic = wind_dic;
            controller.b_wind_angle = wind_angle;
            
        }
        
        
    
    }
    
    if([segue.identifier isEqualToString:@"info2"])
    {
    
        SwanViewController *controller2 = (SwanViewController *)segue.destinationViewController;
        
        controller2.s_name = name_swan;
        controller2.s_fancyname = fancyname_swan;
        controller2.s_lat = lat_swan;
        controller2.s_lon = lon_swan;
        controller2.s_type = type_swan;
        
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
