//
//  SDViewController.m
//  SDWebImageHEIFCoder
//
//  Created by DreamPiggy on 05/08/2018.
//  Copyright (c) 2018 DreamPiggy. All rights reserved.
//

#import "SDViewController.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImageHEIFCoder/SDWebImageHEIFCoder.h>

@interface SDViewController ()

@end

@implementation SDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *singleHEICURL = [NSURL URLWithString:@"http://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic"];
    NSURL *animatedHEICURL = [NSURL URLWithString:@"http://nokiatech.github.io/heif/content/image_sequences/starfield_animation.heic"];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height / 2)];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, screenSize.height / 2, screenSize.width, screenSize.height / 2)];
    
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    
    [imageView1 sd_setImageWithURL:singleHEICURL placeholderImage:nil options:0 context:@{SDWebImageContextImageThumbnailPixelSize : @(CGSizeMake(500, 500))} progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (image) {
            NSLog(@"Single HEIC load success");
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                NSData *data = [[SDImageHEIFCoder sharedCoder] encodedDataWithImage:image format:SDImageFormatHEIC options:@{SDImageCoderEncodeMaxPixelSize : @(CGSizeMake(100, 100))}];
                NSAssert(data, @"HEIC encoding failed");
                UIImage *thumbnailImage = [[SDImageHEIFCoder sharedCoder] decodedImageWithData:data options:@{SDImageCoderDecodeThumbnailPixelSize : @(CGSizeMake(100, 100))}];
                NSAssert(thumbnailImage.size.width == 100, @"HEIC thumbnail encoding and then thumbnail decoding");
                NSLog(@"HEIC encoding success");
            });
        }
    }];
    [imageView2 sd_setImageWithURL:animatedHEICURL completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        // libheif currently does not supports animation
        if (image) {
            NSLog(@"Still HEIF load success");
        }
    }];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
