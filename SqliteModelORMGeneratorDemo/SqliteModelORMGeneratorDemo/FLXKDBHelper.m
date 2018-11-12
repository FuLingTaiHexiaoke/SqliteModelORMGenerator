//
//  PsyDBHelper.m
//  PSYLife-NewStructure
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 apple. All rights reserved.
//
#import <objc/runtime.h>
#import "FLXKDBHelper.h"
//#import "PsyBaseModelForPersistence.h"

@interface FLXKDBHelper ()

@property (nonatomic, retain) FMDatabaseQueue *dbQueue;

@end
@implementation FLXKDBHelper

static FLXKDBHelper *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance;
}

+ (NSString *)dbPathWithDirectoryName:(NSString *)directoryName
{
    //get documentDirectory
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *filemanage = [NSFileManager defaultManager];
    if (directoryName == nil || directoryName.length == 0) {
        documentDirectory = [documentDirectory stringByAppendingPathComponent:@"FLXKEmotionDB"];
    } else {
        documentDirectory = [documentDirectory stringByAppendingPathComponent:directoryName];
    }

    //check documentDirectory exist
    BOOL isDir;
    BOOL exit =[filemanage fileExistsAtPath:documentDirectory isDirectory:&isDir];
    if (!exit || !isDir) {
        [filemanage createDirectoryAtPath:documentDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }

    //set dbPath
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"FLXKEmotionDB.sqlite"];

    NSLog(@"FLXKEmotionDB Directory:\n%@",dbPath);
    return dbPath;

}

//+ (NSString *)dbPathWithDirectoryName:(NSString *)directoryName
//{
//    //get documentDirectory
//    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSFileManager *filemanage = [NSFileManager defaultManager];
//    if (directoryName == nil || directoryName.length == 0) {
//        documentDirectory = [documentDirectory stringByAppendingPathComponent:@"FLXKEmotionDB"];
//    } else {
//        documentDirectory = [documentDirectory stringByAppendingPathComponent:directoryName];
//    }
//
//    //check documentDirectory exist
//    BOOL isDir;
//    BOOL exit =[filemanage fileExistsAtPath:documentDirectory isDirectory:&isDir];
//    if (!exit || !isDir) {
//        [filemanage createDirectoryAtPath:documentDirectory withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//
//    //set dbPath
//    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"FLXKEmotionDB.sqlite"];
//
//    //check if already sqlite exist
//    BOOL dbExit =[filemanage fileExistsAtPath:dbPath];
//    if (DEBUG) {
//        if (dbExit) {
//            [filemanage removeItemAtPath:dbPath error:nil];
//            NSString* bundleDBPath=[[NSBundle mainBundle]pathForResource:@"FLXKEmotionDB" ofType:@"sqlite"];
//            BOOL bundleDBExit =[filemanage fileExistsAtPath:bundleDBPath];
//            if (bundleDBExit) {
//                [filemanage copyItemAtPath:bundleDBPath toPath:dbPath error:nil];
//            }
//        }
//        else{
//            NSString* bundleDBPath=[[NSBundle mainBundle]pathForResource:@"FLXKEmotionDB" ofType:@"sqlite"];
//            BOOL bundleDBExit =[filemanage fileExistsAtPath:bundleDBPath];
//            if (bundleDBExit) {
//                [filemanage copyItemAtPath:bundleDBPath toPath:dbPath error:nil];
//            }
//        }
//    }
//    else{
//        if (!dbExit) {
//            NSString* bundleDBPath=[[NSBundle mainBundle]pathForResource:@"FLXKEmotionDB" ofType:@"sqlite"];
//            BOOL bundleDBExit =[filemanage fileExistsAtPath:bundleDBPath];
//            if (bundleDBExit) {
//                [filemanage copyItemAtPath:bundleDBPath toPath:dbPath error:nil];
//            }
//        }
//    }
//
//    NSLog(@"FLXKEmotionDB Directory:\n%@",dbPath);
//    return dbPath;
//
//}

+ (NSString *)dbPathInBundleWithDirectoryName:(NSString *)directoryName
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString*  bundlePath= [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:directoryName];
    BOOL isFileExistWithBundlePath = [fileManager fileExistsAtPath:bundlePath];
    if(!isFileExistWithBundlePath)
    {
        return nil;
    }
    return bundlePath;
}

+ (NSString *)dbPath
{
        return [self dbPathWithDirectoryName:nil];
}

- (FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
        //1
        //2
        //3
    }
    return _dbQueue;
}

//- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName
//{
//    if (_instance.dbQueue) {
//        _instance.dbQueue = nil;
//    }
//    _instance.dbQueue = [[FMDatabaseQueue alloc] initWithPath:[PsyDBHelper dbPathWithDirectoryName:directoryName]];
//
//    int numClasses;
//    Class *classes = NULL;
//    numClasses = objc_getClassList(NULL,0);
//
//    if (numClasses >0 )
//    {
//        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
//        numClasses = objc_getClassList(classes, numClasses);
//        for (int i = 0; i < numClasses; i++) {
//            if (class_getSuperclass(classes[i]) == [PsyBaseModelForPersistence class]){
//                id class = classes[i];
//                [class performSelector:@selector(createTable) withObject:nil];
//            }
//        }
//        free(classes);
//    }
//
//    return YES;
//}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [FLXKDBHelper shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [FLXKDBHelper shareInstance];
}

#if ! __has_feature(objc_arc)
- (oneway void)release
{
    
}

- (id)autorelease
{
    return _instance;
}

- (NSUInteger)retainCount
{
    return 1;
}
#endif

@end
