//
//  RadarViewController.m
//  CariCOOS
//
//  Created by Pedro Correa on 10/15/14.
//  Copyright (c) 2014 CariCOOS. All rights reserved.
//

#import "RadarViewController.h"

@interface RadarViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *Radar;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;



@end

@implementation RadarViewController
- (IBAction)Refresh:(id)sender {
    
    self.Radar.scrollView.showsHorizontalScrollIndicator = NO;
    self.Radar.scrollView.showsVerticalScrollIndicator = NO;
    
    NSString *fullURL = @"http://radar.weather.gov/lite/N0R/JUA_loop.gif";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.Radar loadRequest:requestObj];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.Radar.delegate = self;
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"title"]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
    
    
    NSString *fullURL = @"http://radar.weather.gov/lite/N0R/JUA_loop.gif";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.Radar loadRequest:requestObj];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner startAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.spinner stopAnimating];
    [self.spinner setHidesWhenStopped:YES];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    UIAlertView *errorView;
    
    errorView = [[UIAlertView alloc]
                 initWithTitle: NSLocalizedString(@"Network error", @"Network error")
                 message: NSLocalizedString(@"No internet connection found, this application requires an internet connection to gather the data required. Please check your connection and hit the refresh button...", @"Network error")
                 delegate: self
                 cancelButtonTitle: NSLocalizedString(@"Close", @"Network error") otherButtonTitles: nil];
    
    [errorView show];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.spinner stopAnimating];
    [self.spinner setHidesWhenStopped:YES];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
