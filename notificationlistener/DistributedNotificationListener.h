//
//  DistributedNotificationListener.h
//  notificationlistener
//
//  Created by Marc Liyanage on 4/29/11.
//

#import <Foundation/Foundation.h>


@interface DistributedNotificationListener : NSObject {
@private
	BOOL shouldTerminate;
}

- (void)run;

@end
