//
//  KenViewController.m
//  UICollection
//
//  Created by Chin-Hui Hsieh  on 6/24/15.
//  Copyright (c) 2015 Chin-Hui Hsieh. All rights reserved.
//
//  https://www.youtube.com/watch?v=dqM2vIvr71I

#import "KenViewController.h"
#import "KenCollectionViewCell.h"

@interface KenViewController () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (strong, nonatomic) NSArray *kenImageArray;

@end



@implementation KenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.kenImageArray = @[@"ken1.png",@"ken2.png",@"ken3.png",@"ken4.png",@"ken5.png",@"ken6.png"];
    
    self.myCollectionView.delegate = self;
    self.myCollectionView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UICollectionViewDelegate>

// highlight : 是否使用該功能
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//highlight :highlight時候動作
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    KenCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor redColor];
    
    NSLog(@"highlight");
    
}

//highlight :unhighlight時候動作
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    KenCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    
    NSLog(@"unhighlight");
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;// called when the user taps on an already-selected item in multi-select mode
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    KenCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.kenImageLabel.backgroundColor = [UIColor blueColor];
    
    NSLog(@"Selected");
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    KenCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    cell.kenImageLabel.backgroundColor = [UIColor orangeColor];
    
    NSLog(@"DE-Selected");
}



#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.kenImageArray count];
}

- (KenCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KenCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"kenImageCell" forIndexPath:indexPath];
    
    NSString *imageViewString = [self.kenImageArray objectAtIndex:indexPath.row];
    
    cell.kenImageView.image = [UIImage imageNamed:imageViewString];
    
    cell.kenImageLabel.text = imageViewString;
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    
    return cell;
    
}


#pragma mark - <UICollectionViewDelegateFlowLayout>

//cell layout尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        return CGSizeMake(150, 150);
}

//section最外圍邊匡厚度
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
//    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//section內，分行最小距離(圖片上下距離)(line space)
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section ==1)
    {
        return 10;
    }else
    {
        return 1;
    }
    
}

//section內，分行最小距離(圖片左右距離)(line space)
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section ==1)
    {
        return 50;
    }else
    {
        return 1;
    }

}

//header SIZE
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section ==1)
    {
        return CGSizeMake(self.view.frame.size.width, 20);
    }else
    {
        return CGSizeMake(self.view.frame.size.width, 5);;
    }
    
}

//footer SIZE
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section ==1)
    {
        return CGSizeMake(self.view.frame.size.width, 20);
        
    }else
    {
        return CGSizeMake(self.view.frame.size.width, 5);;
    }

}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
