//
//  AnccSettingWC.m
//  Anccccccc
//
//  Created by Ancc on 14/12/18.
//  Copyright (c) 2014年 Ancc. All rights reserved.
//

#import "AnccSettingWC.h"
#import "AnccDataManager.h"
#define FULLSIZE (NSViewMinXMargin | NSViewWidthSizable | NSViewMaxXMargin | NSViewMinYMargin | NSViewHeightSizable | NSViewMaxYMargin)

@interface AnccSettingWC ()<NSTableViewDelegate,NSTableViewDataSource>
//@property (weak) IBOutlet NSTableView *KvTableView;
@property (nonatomic,strong)NSTableView *tableView;
//@property (nonatomic,strong)NSMutableArray  *tableData;
@end

@implementation AnccSettingWC

- (void)windowDidLoad {
    [super windowDidLoad];
//    self.KvTableView.delegate=self;
//    self.KvTableView.dataSource=self;
////    self.KvTableView.rowHeight=44;
//    [self.KvTableView reloadData];
}



- (void)awakeFromNib
{
    
    NSRect frame=[self.window frame];
    
    frame.origin.y+=25;
    frame.size.height-=25;
    
//    self.tableData=[[NSMutableArray alloc] init];
    
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
//    [dic setObject:@"hahah" forKey:@"1"];
//    [dic setObject:@"125" forKey:@"2"];
//    [self.tableData addObject:dic];
//
//    dic=[[NSMutableDictionary alloc] init];
//    [dic setObject:@"Hello" forKey:@"1"];
//    [dic setObject:@"150" forKey:@"2"];
//    [self.tableData addObject:dic];

    
    NSScrollView *scrollView=[[NSScrollView alloc] initWithFrame:frame];
    [scrollView setAutoresizingMask:FULLSIZE];
    [scrollView setBackgroundColor:[NSColor redColor]];
    
    frame.size.height-=16;
    NSTableView *tableView = [[NSTableView alloc] initWithFrame:frame];
    [tableView setAutosaveName:@"downloadTableView"];
    self.tableView=tableView;
    
    frame.origin.y=frame.size.height;
    frame.size.height=17;
    
    NSTableHeaderView *tableHeadView=[[NSTableHeaderView alloc] initWithFrame:frame];
    [tableView setHeaderView:tableHeadView];

    
    [tableView setAutoresizesSubviews:FULLSIZE];
    [tableView setBackgroundColor:[NSColor whiteColor]];
    [tableView setGridColor:[NSColor lightGrayColor]];
    [tableView setGridStyleMask: NSTableViewSolidHorizontalGridLineMask];
    [tableView setUsesAlternatingRowBackgroundColors:YES];
    [tableView setAutosaveTableColumns:YES];
    [tableView setAllowsEmptySelection:YES];
    [tableView setAllowsColumnSelection:YES];
    
    {
        NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:@"DataKey"];
        [[column headerCell] setStringValue:@"Key"];
        [[column headerCell] setAlignment:NSCenterTextAlignment];
        [column setWidth:frame.size.width/3.];
        [column setMinWidth:frame.size.width/3.];
        [column setEditable:NO];
        [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
        [[column dataCell] setAlignment:NSCenterTextAlignment];
        [self.tableView addTableColumn:column];
    }
    
    {
        NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:@"DataValue"];
        [[column headerCell] setStringValue:@"Value"];
        [[column headerCell] setAlignment:NSCenterTextAlignment];
        [column setWidth:frame.size.width/3.*2];
        [column setMinWidth:frame.size.width/3.*2];
        [column setEditable:NO];
        [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
        [[column dataCell] setAlignment:NSCenterTextAlignment];
        [self.tableView addTableColumn:column];
    }

    [tableView setDataSource:self];
    tableView.delegate=self;
    [scrollView setDocumentView:tableView];
    
    [self.window setContentView:scrollView];

}

#pragma mark NSTableViewDataSource Delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [[AnccDataManager allKey] count];
}

- (id)tableView: (NSTableView *)theTableView objectValueForTableColumn: (NSTableColumn *)theColumn row: (NSInteger)rowIndex
{
    if([theColumn.identifier isEqualToString:@"DataKey"])
    {
        return [AnccDataManager allKey][rowIndex];
    }else   if([theColumn.identifier isEqualToString:@"DataValue"]){
        return [AnccDataManager valueForKey:[AnccDataManager allKey][rowIndex]];
    }
    return nil;
}
-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 44.0;
}
@end
