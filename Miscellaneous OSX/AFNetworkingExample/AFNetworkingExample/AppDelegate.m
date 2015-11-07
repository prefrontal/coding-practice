//
//  AppDelegate.m
//  AFNetworkingExample
//
//  Created by Craig Bennett on 11/6/15.
//  Copyright © 2015 Voxelwise. All rights reserved.
//

#import "AppDelegate.h"

#import "AFNetworking.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    [manager GET:@"http://ip.jsontest.com" parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject)
        {
            NSLog (@"JSON: %@", [responseObject objectForKey:@"ip"]);
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error)
        {
            NSLog (@"Error: %@", error);
        }
     ];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

@end
