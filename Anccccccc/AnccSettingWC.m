//
//  AnccSettingWC.m
//  Anccccccc
//
//  Created by Ancc on 14/12/18.
//  Copyright (c) 2014年 Ancc. All rights reserved.
//

#import "AnccSettingWC.h"
#import "AnccDataManager.h"

@interface AnccSettingWC ()<NSTableViewDataSource,NSTableViewDelegate>

@property (weak) IBOutlet NSScrollView *pScrollView;
@property (nonatomic,strong)NSTableView *documentTV;

@property (weak) IBOutlet NSTextField *keyTF;
@property (weak) IBOutlet NSTextField *valueTF;
@property (weak) IBOutlet NSTextField *descriptionTF;
@end

@implementation AnccSettingWC

- (void)windowDidLoad {
    [super windowDidLoad];
}
-(void)awakeFromNib
{
    NSRect frame=[self.pScrollView frame];
    
    frame.size.height-=16;
    NSTableView *tableView = [[NSTableView alloc] initWithFrame:frame];
    [tableView setAutosaveName:@"downloadTableView"];
    
    frame.origin.y=frame.size.height;
    frame.size.height=17;
    
//    NSTableHeaderView *tableHeadView=[[NSTableHeaderView alloc] initWithFrame:frame];
//    [tableView setHeaderView:tableHeadView];
    
    
    [tableView setBackgroundColor:[NSColor whiteColor]];
//    [tableView setGridColor:[NSColor lightGrayColor]];
    [tableView setGridStyleMask: NSTableViewSolidHorizontalGridLineMask];
    [tableView setUsesAlternatingRowBackgroundColors:YES];
    [tableView setAutosaveTableColumns:YES];
    [tableView setAllowsEmptySelection:YES];
    [tableView setAllowsColumnSelection:YES];
    
    
    {
        NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:@"DataKey"];
        [[column headerCell] setStringValue:@"Key"];
        [[column headerCell] setAlignment:NSCenterTextAlignment];
        [column setWidth:frame.size.width];
        [column setMinWidth:frame.size.width];
        [column setEditable:NO];
        [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
        [[column dataCell] setAlignment:NSCenterTextAlignment];
        [tableView addTableColumn:column];
    }
    
    
    [tableView setDataSource:self];
    tableView.delegate=self;
    [tableView setAction:@selector(didTableView)];
    [self.pScrollView setDocumentView:self.documentTV=tableView];
}
-(void)didTableView
{
    NSInteger rowNumber = [self.documentTV clickedRow];
    if([AnccDataManager allKey].count<=rowNumber)
    {
        return;
    }
    [self clearValue];
    self.keyTF.stringValue = [AnccDataManager allKey][rowNumber];
    self.valueTF.stringValue = [AnccDataManager valueForKey:[AnccDataManager allKey][rowNumber]];
    self.descriptionTF.stringValue = [AnccDataManager descriptionForKey:[AnccDataManager allKey][rowNumber]];;
    [self.keyTF becomeFirstResponder];
}


- (IBAction)addKvData:(NSButton *)sender
{
//    NSLog(@"%@",NSStringFromSelector(_cmd));
    [self clearValue];
    [self.keyTF becomeFirstResponder];
}
- (IBAction)deleteKvData:(NSButton *)sender
{
//    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSString *keyStr = self.keyTF.stringValue;
    if(keyStr.length==0)
    {
        [self showAlert:@"key == nil"];
        return;
    }
    if(![AnccDataManager containKey:keyStr])
    {
        [self showAlert:@"key值没有对应的value "];
        return;
    }
    [AnccDataManager removeStringForKey:keyStr];
    [self clearValue];
    [self reloadScrollView];
    [self showAlert:@"删除成功"];
}
- (IBAction)saveKvData:(NSButton *)sender
{
//    NSLog(@"%@",NSStringFromSelector(_cmd));
    NSString *keyStr = self.keyTF.stringValue;
    NSString *valueStr = self.valueTF.stringValue;
    NSString *descriptionStr = self.descriptionTF.stringValue;
    if(keyStr.length==0)
    {
        [self showAlert:@"key == nil"];
        return;
    }
    if(valueStr.length==0)
    {
        [self showAlert:@"value == nil"];
        return;
    }
    if(keyStr.length<4)
    {
        [self showAlert:@"key.length<4\n不建议使用太短的替换宏"];
        return;
    }
    if([keyStr rangeOfString:@" "].location!=NSNotFound)
    {
        [self showAlert:@"亲,有空格"];
        return;
    }
    
    descriptionStr=descriptionStr.length==0?@"":descriptionStr;

    [AnccDataManager setString:valueStr forKey:keyStr andDescription:descriptionStr];
    [self clearValue];
    [self reloadScrollView];
    [self showAlert:@"添加成功"];
}
///////////////////////////////////////////////////////////////////////////////////////////
-(void)reloadScrollView
{
    [self.documentTV reloadData];
}
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

///////////////////////////////////////////////////////////////////////////////////////////
-(void)showAlert:(NSString *)message
{
    NSAlert *alert = [[NSAlert alloc]init];
    alert.messageText=message;
    [alert runModal];
}
-(void)clearValue
{
    self.keyTF.stringValue = @"";
    self.valueTF.stringValue = @"";
    self.descriptionTF.stringValue = @"";
}
@end
