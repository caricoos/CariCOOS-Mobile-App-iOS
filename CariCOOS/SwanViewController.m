//
//  SwanViewController.m
//  CariCOOS
//
//  Created by Pedro Correa on 2/18/15.
//  Copyright (c) 2015 CariCOOS. All rights reserved.
//

#import "SwanViewController.h"

@interface SwanViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *Swan;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner1;


@end

@implementation SwanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.Swan.delegate = self;
    
    self.Swan.scrollView.showsHorizontalScrollIndicator = NO;
    self.Swan.scrollView.showsVerticalScrollIndicator = NO;
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"title"]];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22 green:0.573 blue:0.89 alpha:1];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    

   
    
    NSString *fullURL = [@"http://caricoos.org/swan_multigrid/point_output/" stringByAppendingString:self.s_name];
    
    fullURL = [fullURL stringByAppendingString:@"_SWAN_point_forecast.png"];
    
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.Swan loadRequest:requestObj];
    
    // Do any additional setup after loading the view.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.spinner1 startAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.spinner1 stopAnimating];
    [self.spinner1 setHidesWhenStopped:YES];
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
    [self.spinner1 stopAnimating];
    [self.spinner1 setHidesWhenStopped:YES];
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
