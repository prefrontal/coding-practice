//
//  AppDelegate.m
//  WyattUDP
//
//  Created by Craig Bennett on 11/19/15.
//  Copyright (c) 2015 Wyatt. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Setup
	udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
	
	NSError *error = nil;
	
	if (![udpSocket bindToPort:0 error:&error])
		NSLog (@"Error binding: %@", error);
	
	if (![udpSocket beginReceiving:&error])
		NSLog (@"Error receiving: %@", error);
	
	[udpSocket enableBroadcast:YES error:&error];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	// Insert code here to tear down your application
}

#pragma mark Interface Actions

- (IBAction) doInstrumentSearch:(id)sender
{
	// Send
	NSString *host = @"255.255.255.255";
	int port = 9300 + 6;
	NSString *msg = @"?6N";
	int tag = 0;
	
	NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
	
	[udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:tag];

	NSLog (@"SENT (%i): %@", (int)tag, msg);
}

#pragma mark UDP Delegates

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didSendDataWithTag:(long)tag
{
	// You could add checks here
	NSLog (@"DidSendData");
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error
{
	// You could add checks here
	NSLog (@"DidNotSendData");
}

- (void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContext
{
	NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	if (msg)
	{
		NSLog (@"RECV: %@", msg);
	}
	else
	{
		NSString *host = nil;
		uint16_t port = 0;
		[GCDAsyncUdpSocket getHost:&host port:&port fromAddress:address];
		
		NSLog (@"RECV: Unknown message from: %@:%hu", host, port);
	}
}

@end
