#import "NSDate+TimeAgo.h"

@implementation NSDate (TimeAgo)

#ifndef NSDateTimeAgoLocalizedStrings
#define NSDateTimeAgoLocalizedStrings(key) \
    NSLocalizedStringFromTable(key, @"NSDateTimeAgo", nil)
#endif

-(NSString *)timeAgo {
    NSDate *now = [NSDate date];
    double deltaSeconds = [self timeIntervalSinceDate:now];
    DLog(@"deltaSeconds: %f", deltaSeconds);
    double deltaMinutes = deltaSeconds / 60.0f;

    // stuff in the past, needs to be comparing against negative values
    if (deltaSeconds < 0) {

        if(deltaSeconds > -5) {
            return NSDateTimeAgoLocalizedStrings(@"Just now");
        } else if(deltaSeconds > -60) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d seconds ago"), (int)abs(deltaSeconds)];
        } else if(deltaSeconds > -120) {
            return NSDateTimeAgoLocalizedStrings(@"A minute ago");
        } else if (deltaMinutes > -60) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d minutes ago"), (int)abs(deltaMinutes)];
        } else if (deltaMinutes > -120) {
            return NSDateTimeAgoLocalizedStrings(@"An hour ago");
        } else if (deltaMinutes > -(24 * 60)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d hours ago"), (int)abs((floor(deltaMinutes/60)))];
        } else if (deltaMinutes > -(24 * 60 * 2)) {
            return NSDateTimeAgoLocalizedStrings(@"Yesterday");
        } else if (deltaMinutes > -(24 * 60 * 7)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d days ago"), (int)abs(floor(deltaMinutes/(60 * 24)))];
        } else if (deltaMinutes > -(24 * 60 * 14)) {
            return NSDateTimeAgoLocalizedStrings(@"Last week");
        } else if (deltaMinutes > -(24 * 60 * 31)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d weeks ago"), (int)abs(floor(deltaMinutes/(60 * 24 * 7)))];
        } else if (deltaMinutes > -(24 * 60 * 61)) {
            return NSDateTimeAgoLocalizedStrings(@"Last month");
        } else if (deltaMinutes > -(24 * 60 * 365.25)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d months ago"), (int)abs(floor(deltaMinutes/(60 * 24 * 30)))];
        } else if (deltaMinutes > -(24 * 60 * 731)) {
            return NSDateTimeAgoLocalizedStrings(@"Last year");
        }
        
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d years ago"), (int)abs(floor(deltaMinutes/(60 * 24 * 365)))];


    }
    else {

        // stuff in the future, needs to emit future strings, drop "ago"
        if(deltaSeconds < 5) {
            return NSDateTimeAgoLocalizedStrings(@"Now");
        } else if(deltaSeconds < 60) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d seconds"), (int)deltaSeconds];
        } else if(deltaSeconds < 120) {
            return NSDateTimeAgoLocalizedStrings(@"1 minute");
        } else if (deltaMinutes < 60) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d minutes"), (int)deltaMinutes];
        } else if (deltaMinutes < 120) {
            return NSDateTimeAgoLocalizedStrings(@"1 hour");
        } else if (deltaMinutes < (24 * 60)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d hours"), (int)floor(deltaMinutes/60)];
        } else if (deltaMinutes < (24 * 60 * 2)) {
            return NSDateTimeAgoLocalizedStrings(@"Tomorrow");
        } else if (deltaMinutes < (24 * 60 * 7)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d days"), (int)floor(deltaMinutes/(60 * 24))];
        } else if (deltaMinutes < (24 * 60 * 14)) {
            return NSDateTimeAgoLocalizedStrings(@"Next Week");
        } else if (deltaMinutes < (24 * 60 * 31)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d weeks"), (int)floor(deltaMinutes/(60 * 24 * 7))];
        } else if (deltaMinutes < (24 * 60 * 61)) {
            return NSDateTimeAgoLocalizedStrings(@"Next month");
        } else if (deltaMinutes < (24 * 60 * 365.25)) {
            return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d months"), (int)floor(deltaMinutes/(60 * 24 * 30))];
        } else if (deltaMinutes < (24 * 60 * 731)) {
            return NSDateTimeAgoLocalizedStrings(@"Next year");
        }
        
        return [NSString stringWithFormat:NSDateTimeAgoLocalizedStrings(@"%d years"), (int)floor(deltaMinutes/(60 * 24 * 365))];

    }
    
}

@end
