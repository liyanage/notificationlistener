//
//  main.m
//  notificationlistener
//
//  Created by Marc Liyanage on 4/29/11.
//

#import <Foundation/Foundation.h>
#import "DistributedNotificationListener.h"

int main (int argc, const char * argv[])
{

	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	DistributedNotificationListener *listener = [[DistributedNotificationListener alloc] init];
	[listener run];
	[listener release];

	[pool drain];
    return 0;
}

