//
//  DistributedNotificationListener.m
//  notificationlistener
//
//  Created by Marc Liyanage on 4/29/11.
//

#import "DistributedNotificationListener.h"


@implementation DistributedNotificationListener

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}


- (void)run
{
	shouldTerminate = NO;

	NSString *notificationName = [[NSUserDefaults standardUserDefaults] stringForKey:@"notificationName"];
	[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(notify:) name:notificationName object:nil];

	dispatch_source_t signalsource = dispatch_source_create(DISPATCH_SOURCE_TYPE_SIGNAL, SIGINT, 0, dispatch_get_main_queue());
	dispatch_source_set_event_handler(signalsource, ^{shouldTerminate = YES;});
	dispatch_resume(signalsource);
	sigignore(SIGINT);
	
	NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
	while (!shouldTerminate) {
		[mainRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
	}
	
	dispatch_source_cancel(signalsource);
	dispatch_release(signalsource);
	
	[[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
}


- (void)notify:(NSNotification *)notification
{
	NSLog(@"Notification: %@", notification);
}


- (void)dealloc
{
    [super dealloc];
}

	

@end
