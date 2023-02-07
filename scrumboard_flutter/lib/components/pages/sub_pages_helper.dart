import 'package:flutter/material.dart';
import 'package:scrumboard_client/scrumboard_client.dart';
import 'package:scrumboard_flutter/components/pages/sub_pages/edit_scrum_board_column.dart';
import 'package:scrumboard_flutter/components/pages/sub_pages/new_scrum_board_work_item.dart';


class SubPageHelper {


  ///Push EditScrumBoardColumnScreen screen to navigator, to either add a new [ScrumBoardColumn]
  ///or to edit an exsistion one. Setting parameter [scrumBoardColumn] to null means a new column
  ///should be created.
  ///Returns: [Future<ScrumBoardColumn?>], null meaning the user backed out of the subPage and no
  ///information was included in the subpage Navigator.pop.
  Future<ScrumBoardColumn?> awaitReturnFromColumnEditForm(
      BuildContext context, ScrumBoardColumn? scrumBoardColumn) async {
    scrumBoardColumn ??= ScrumBoardColumn(heading: "");

    final ScrumBoardColumn? returnedColumn = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            //We set scrumBoardColumn to non nullable with ! as we make sure that scrumBoardColumn never will be null as the first thing in this method.
            EditScrumBoardColumnScreen(column: scrumBoardColumn!),
      ),
    );
    return returnedColumn;
  }

  Future<ScrumBoardWorkItem?> awaitReturnFromWorkItemEditForm(
      BuildContext context, ScrumBoardWorkItem? workItem) async {
    //If workItem is null then set it to ScrumBoardWorkItem(name: "", description: "").
    workItem ??= ScrumBoardWorkItem(name: "", description: "", columnIndex: 0, scurmBoardColumnId: 0);

    final ScrumBoardWorkItem? returnedWorkItem = await Navigator.push(
      context,
      MaterialPageRoute(
        //We set workItem to non nullable with ! as we make sure that workItem never will be null as the first thing in this method.
        builder: (context) => NewScrumBoardWorkItem(workItem: workItem!),
      ),
    );
    return returnedWorkItem;
  }
}
