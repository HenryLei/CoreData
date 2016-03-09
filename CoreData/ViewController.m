//
//  ViewController.m
//  CoreData
//
//  Created by App Team on 16/3/5.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = [UIApplication sharedApplication].delegate;
    
//    [self saveText];
//    [self readTextData];
    [self searchText];
    
    
    
    
}

- (void)saveText{
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:@"Province" inManagedObjectContext:self.delegate.managedObjectContext];
    
    [object setValue:@"shenzhen" forKey:@"cityname"];
    [object setValue:@"henrylei" forKey:@"privincename"];
    [object setValue:[NSNumber numberWithInt:4] forKey:@"cityid"];
//    [object setValue:[NSNumber numberWithInt:3] forKey:@"cityid"];
//    [object setValue:[NSNumber numberWithInt:2] forKey:@"cityid"];
    
    [self.delegate saveContext];
}

- (void)readTextData{
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *object = [NSEntityDescription entityForName:@"Province" inManagedObjectContext:self.delegate.managedObjectContext];
    [fetch setEntity:object];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"cityid" ascending:NO];
    NSLog(@"%@", sort);
    
    NSArray *sortarr = [[NSArray alloc] initWithObjects:sort, nil];
    [fetch setSortDescriptors:sortarr];
    
    NSError *error;
    NSArray *fetchresult = [self.delegate.managedObjectContext executeFetchRequest:fetch error:&error];
    for (NSManagedObject *object in fetchresult) {
        NSLog(@"%@", [object valueForKey:@"privincename"]);
        NSLog(@"%@", [object valueForKey:@"cityid"]);
    }
    
    NSLog(@"fetchresult is:%@", fetchresult);
}

- (void)searchText{
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置要查询的实体
    request.entity = [NSEntityDescription entityForName:@"Province" inManagedObjectContext:self.delegate.managedObjectContext];
    // 设置排序（按照age降序）
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"cityid" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    NSLog(@"request.sortDescriptors:%@", request.sortDescriptors);
    // 设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%Itcast-1%应该写成*Itcast-1*)
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cityid like %@", @"*Itcast-1*"];
    request.predicate = predicate;
    // 执行请求
    NSError *error = nil;
    NSArray *objs = [self.delegate.managedObjectContext executeFetchRequest:request error:&error];
    if (error) {
        [NSException raise:@"查询错误" format:@"%@", [error localizedDescription]];
    }
    NSLog(@"objs:%@", objs);
    // 遍历数据
    for (NSManagedObject *obj in objs) {
        NSLog(@"name=%@", [obj valueForKey:@"cityid"]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end














