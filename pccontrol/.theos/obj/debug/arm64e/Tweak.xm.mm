#line 1 "Tweak.xm"

#include "headers/BKUserEventTimer.h"

#include <UIKit/UIKit.h>
#include <objc/runtime.h>
#include <sys/sysctl.h>
#include <sys/xattr.h>
#include <substrate.h>
#include <math.h>

#include <mach/mach.h>
#import <CoreGraphics/CoreGraphics.h>
#import <IOKit/hid/IOHIDService.h>

#include<mach-o/dyld.h>

#include <stdlib.h>
#include "socketConfig.h"

#include <stdio.h>
#include <unistd.h>
#include <signal.h>

#include <notify.h>
#include "headers/CFUserNotification.h"
#import <os/lock.h>

#include "Touch.h"
#include "SocketServer.h"
#include "Common.h"
#include "Screen.h"
#include "AlertBox.h"


#define DEBUG_MODE

#ifdef DEBUG_MODE
#define CHECKER true
#else
#define CHECKER !isExpired
#endif

#define IPHONE7P_HEIGHT 1920
#define IPHONE7P_WIDTH 1080

#define IPADPRO_HEIGHT 2732
#define IPADPRO_WIDTH 2048

#define SET_SIZE 9



@interface SBApplication : NSObject {
}
@end

int daemonSock = -1;


typedef struct　eventInfo_s* eventInfo;
typedef struct Node* llNodePtr;
typedef struct eventData_s* eventDataPtr;


const int TOUCH_EVENT_ARR_LEN = 20;

Boolean isCrazyTapping = false;
Boolean isRecording = false;



const NSString *recordingScriptName = @"rec";


eventInfo touchEventArr[TOUCH_EVENT_ARR_LEN] = {0};


llNodePtr eventLinkedListHead = NULL;


Boolean isInitializedSuccess = true;

int getDaemonSocket();
void *(*IOHIDEventAppendEventOld)(IOHIDEventRef parent, IOHIDEventRef child);


float getRandomNumberFloat(float min, float max);

int getTaskType(UInt8* dataArray);

void handle_event (void* target, void* refcon, IOHIDServiceRef service, IOHIDEventRef event);




void setSenderIdCallback(void* target, void* refcon, IOHIDServiceRef service, IOHIDEventRef event);

static void stopCrazyTapCallback();
void crazyTapTimeUpCallback();
void stopCrazyTap();
void processTask(UInt8 *buff);





void stopCrazyTap()
{
    isCrazyTapping = false;
}









static void stopCrazyTapCallback()
{
    stopCrazyTap();
}


void crazyTapTimeUpCallback(int sig)
{
    NSLog(@"com.zjx.springboard: crazy tap stop.");
    stopCrazyTap();
}

void dontPutThisFileIntoIda()
{
    return;
}

void becauseTheSourceCodeWillBeReleasedAtGithub()
{
    return;
}

void repoNameIsIOS13SimulateTouch()
{
    return;
}



static __attribute__((constructor)) void _logosLocalCtor_12e9ef66(int __unused argc, char __unused **argv, char __unused **envp){
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        










































        if (true) 
        {
            
            startSetSenderIDCallBack();

            socketServer();
        }
        else
        {
            NSLog(@"### com.zjx.springboard: expired");
            showAlertBox(@"Version Outdated", @"ZJXTouchSimulation: This version of ZJXSimulateTouch library is too old and cannot work anymore. Please update it on Cydia.", 999);
        }
    });
    
}


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SpringBoard; 
static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); 

#line 211 "Tweak.xm"

#define CGRectSetPos( r, x, y ) CGRectMake( x, y, r.size.width, r.size.height )


static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);
    CGFloat screen_scale = [[UIScreen mainScreen] scale];

    CGFloat width = [UIScreen mainScreen].bounds.size.width * screen_scale;
    CGFloat height = [UIScreen mainScreen].bounds.size.height * screen_scale;

    setScreenSize(width<height?width:height, width>height?width:height);


    NSLog(@"com.zjx.springboard: width: %f, height: %f", width, height);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);} }
#line 229 "Tweak.xm"