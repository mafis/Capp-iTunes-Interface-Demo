/*
 * AppController.j
 * DevAppClient
 *
 * Created by You on October 26, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

var groups = [[CPArray alloc] initWithObjects:"Groups","Snippets","Frameworks","Tutorials"];

@implementation SourceListController : CPObject
{
	@outlet SourceDataController sourceDataController;
	@outlet CPTableView sourceListView;
}

-(void)awakeFromCib
{
    
	console.log(sourceDataController);
}

- (int)numberOfRowsInTableView:(CPTableView)tableView
{
     return [groups count];
}


- (id)tableView:(CPTableView)tableView objectValueForTableColumn:(CPTableColumn)tableColumn row:(int)row
{
     return [groups objectAtIndex:row];
}

- (BOOL)tableView:(CPTableView)aTableView shouldSelectRow:(int)aRow
{
    if (aRow === 0)
        return NO;

    var callback = function()
    {
        [aTableView selectRowIndexes:[CPIndexSet indexSetWithIndex:aRow] byExtendingSelection:NO];
        [self tableViewSelectionDidChange:nil];
    }
	
	return YES;
}

- (BOOL)tableView:(CPTableView)aTableView isGroupRow:(int)aRow
{
    return aRow === 0;
}


- (void)tableViewSelectionDidChange:(CPNotification)aNotification
{
    var selectedRow = MAX([sourceListView selectedRow] - 1, CPNotFound);

	console.log(selectedRow);
    if (selectedRow === CPNotFound)
    {
        [CPApp setArguments:[]];
       // [sourceDataController setType:nil];
    }
    else
    {
        [sourceDataController setType:selectedRow];
    }

  //  [[[[CPApp delegate] mainWindow] toolbar] validateVisibleItems];
}

@end
