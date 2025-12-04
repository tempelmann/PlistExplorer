/*
 *  PlistExplorerMain.c
 *  PlistExplorer
 *
 *  Created by Thomas Tempelmann 4 Dec 2025
 */

#import <Cocoa/Cocoa.h>
#import <sysexits.h>
#import "PlistExplorer.h"
#import "PlistLogger.h"

@interface PlistStringLogger : PlistLogger {
	NSMutableString *_output;
}
	@property NSMutableString *output;
@end

@implementation PlistStringLogger

@synthesize output = _output;

- (void)logStringOfObject:(id)object level:(NSInteger)level {
	for (NSInteger i = 0; i < level; i++) {
		[self.output appendString:@"  "];
	}
	[self.output appendFormat:@"%@\n",[object logString]];
}

@end

extern NSString* decodePlist (NSData *data);

NSString* decodePlist (NSData *data)
{
	@autoreleasepool {
		PlistExplorer *explorer = [[PlistExplorer alloc] init];
		PlistStringLogger *logger = [[PlistStringLogger alloc] init];
		logger.output = [NSMutableString new];
		id res = [explorer crackData:data];
		[res logYourselfUsing:logger];
		return logger.output;
	}
}
