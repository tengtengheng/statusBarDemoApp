//
//  MasterViewController.m
//  ludytest
//
//  Created by mx1614 on 1/17/19.
//  Copyright © 2019 ludy. All rights reserved.
//

#import "MasterViewController.h"
#import "ScaryBugData.h"
#import "ScaryBugDoc.h"
#import "EDStarRating.h"
#import <Quartz/Quartz.h>
#import "NSImage+Extras.h"

@interface MasterViewController ()<NSTableViewDataSource, NSTabViewDelegate>

@property (weak) IBOutlet NSTableView *bugsTableview;

@property (weak) IBOutlet NSTextField *bugTitleView;
@property (weak) IBOutlet EDStarRating *bugRating;

@property (weak) IBOutlet NSImageView *bugImageView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    self.bugRating.starImage = [NSImage imageNamed:@"5.jpg"];
    self.bugRating.starHighlightedImage = [NSImage imageNamed:@"shockedface2_full.png"];
    self.bugRating.starImage = [NSImage imageNamed:@"shockedface2_empty.png"];
    self.bugRating.maxRating = 5.0;
    self.bugRating.delegate = (id<EDStarRatingProtocol>)self;
    self.bugRating.horizontalMargin = 12;
    self.bugRating.editable = YES;
    self.bugRating.displayMode = EDStarRatingDisplayFull;
    self.bugRating.rating = 0.0;
}

- (ScaryBugDoc *)selectedBugDoc
{
    NSInteger selectedRow = [self.bugsTableview selectedRow];
    if (selectedRow >= 0 && self.bugs.count > selectedRow) {
        ScaryBugDoc *selectedBug = [self.bugs objectAtIndex:selectedRow];
        return selectedBug;
    }
    return nil;
}

- (void)setDatailInfo:(ScaryBugDoc *)doc
{
    NSString *title = @"";
    NSImage *image = nil;
    float rating = 0.0;
    if (doc != nil) {
        title = doc.data.title;
        image = doc.fullImage;
        rating = doc.data.rating;
    }
    [self.bugTitleView setStringValue:title];
    [self.bugImageView setImage:image];
    [self.bugRating setRating:rating];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    [self setDatailInfo:selectedDoc];
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    NSLog(@"self.bugs.count = %ld", self.bugs.count);
    return self.bugs.count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSLog(@"view fresh");
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    if ([tableColumn.identifier isEqualToString:@"BugColumn"]) {
        ScaryBugDoc *bugDoc = [self.bugs objectAtIndex:row];
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        NSLog(@"data.title = %@", bugDoc.data.title);
        return cellView;
    }
    return cellView;
}

- (IBAction)sayworld:(id)sender {
    _worldcounter.stringValue = @"nihao";
}

- (IBAction)addBug:(id)sender {
    ScaryBugDoc *newDoc = [[ScaryBugDoc alloc] initWithTitle:@"New Bug" rating:0.0 thumbImage:nil fullImage:nil];
    [self.bugs addObject:newDoc];
    NSInteger newRowIndex = self.bugs.count - 1;
    [self.bugsTableview insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:NSTableViewAnimationEffectGap];
    [self.bugsTableview selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    [self.bugsTableview scrollRowToVisible:newRowIndex];
}


- (IBAction)deleteBug:(id)sender {
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc) {
        [self.bugs removeObject:selectedDoc];
        [self.bugsTableview removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.bugsTableview.selectedRow] withAnimation:NSTableViewAnimationSlideRight];
        [self setDatailInfo:nil];
    }
}

- (IBAction)bugTitleDidEndEdit:(NSTextField *)sender
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    selectedDoc.data.title = [self.bugTitleView stringValue];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:selectedDoc]];
    NSIndexSet *columnSet = [NSIndexSet indexSetWithIndex:0];
    [self.bugsTableview reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
    
}

- (void)starsSelectionChanged:(EDStarRating *)control rating:(float)rating
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc) {
        selectedDoc.data.rating = self.bugRating.rating;
    }
}


- (IBAction)ChangePicture:(NSButton *)sender {
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc) {
        [[IKPictureTaker pictureTaker] beginPictureTakerSheetForWindow:self.view.window withDelegate:self didEndSelector:@selector(pictureTakerDidEnd:returnCode:contextInfo:) contextInfo:nil];    
    }
}

// 图片选择后的回答方法
- (void) pictureTakerDidEnd:(IKPictureTaker *) picker returnCode:(NSInteger) code contextInfo:(void*) contextInfo{
    NSImage *image = [picker outputImage];
    if( image !=nil && (code == NSModalResponseOK) ){
        [self.bugImageView setImage:image];
        ScaryBugDoc * selectedBugDoc = [self selectedBugDoc];
        if( selectedBugDoc ){
            // 1.设置选中的图片
            selectedBugDoc.fullImage = image;
            // 2. 设置缩略图片
            selectedBugDoc.thumbImage = [image imageByScalingAndCroppingForSize:CGSizeMake( 44, 44 )];
            // 3. 获取位置并刷新表格
            NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:selectedBugDoc]];
            NSIndexSet * columnSet = [NSIndexSet indexSetWithIndex:0];
            [self.bugsTableview reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
        }
    }
}

@end
