//
//  AppDelegate.h
//  WyattUDP
//
//  Created by Craig Bennett on 11/19/15.
//  Copyright (c) 2015 Wyatt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "GCDAsyncUdpSocket.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, GCDAsyncUdpSocketDelegate>
{
	GCDAsyncUdpSocket *udpSocket;
}

- (IBAction) doInstrumentSearch:(id)sender;

@end

