//
//  Province+CoreDataProperties.h
//  CoreData
//
//  Created by App Team on 16/3/8.
//  Copyright © 2016年 test. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Province.h"

NS_ASSUME_NONNULL_BEGIN

@interface Province (CoreDataProperties)

@property (nonatomic) int32_t cityid;
@property (nullable, nonatomic, retain) NSString *cityname;
@property (nonatomic) int32_t provinceid;
@property (nullable, nonatomic, retain) NSString *privincename;

@end

NS_ASSUME_NONNULL_END
