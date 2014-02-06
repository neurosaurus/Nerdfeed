//
//  TGCoursesViewController.m
//  Nerdfeed
//
//  Created by Tripta Gupta on 2/6/14.
//  Copyright (c) 2014 Tripta Gupta. All rights reserved.
//

#import "TGCoursesViewController.h"

@interface TGCoursesViewController ()

@property (nonatomic) NSURLSession *session;

@end

@implementation TGCoursesViewController

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"TG Courses";
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURlSession sessionWithConfiguration:config
                                                 delegate:nil
                                            delegateQueue:nil];
    }
    return self;
}

- (void)fetchFeed
{
    NSString *requestString = @"http://bookapi.bignerdranch.com/courses.json";
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req
                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                         NSString *json = [[NSString alloc] initWithData:data
                                                                                                encoding:NSUTF8StringEncoding];
                                                     }];
    [dataTask resume];
}

@end
