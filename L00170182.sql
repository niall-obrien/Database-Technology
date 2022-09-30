#Assignment solution
# Student name: Niall o'Brien
# Student ID: L00170182

#Queries required
#USE kando;

#1. List all of the users in the Kando database. List by First name, Surname in alphabetical order by Surname.
#/*
SELECT Fname, Sname
	FROM `user`
    ORDER BY Sname
;
#*/
#2. List the ID, Name and description of each board along with the user ID and name of each board owner.
/*
SELECT b.BoardID, BoardName, BoardDesc, GROUP_CONCAT(Fname, ' ', Sname) 'Board Owner Name(s)', u.UserID
	FROM `board_owner` bo, board b, `user` u
    WHERE b.BoardID = bo.BoardID
    AND bo.UserID = u.UserID
    GROUP BY b.BoardID
;
#*/
#3. List all of the users in the Kando database. List by Firstname, Surname in alphabetical order by Surname. Show if the account has been validated or not replacing ‘0’ or ‘1’ with ‘no’ or ‘yes’ as appropriate. 
/*
SELECT CONCAT(Fname, ' ', Sname) 'User Name', IF(AccountValidated, 'Yes', 'No') 'Account Validated'
	FROM `user`
    ORDER BY Sname
;
#*/
#4. List the board ID, Board Name and the names of all of the members of the board “Product launch” (search by board name, not ID).
/*
SELECT b.BoardID, b.BoardName, CONCAT(u.Fname, ' ', u.Sname) 'Board Member Names'
	FROM board b, `user` u, board_member bm
    WHERE b.BoardID = bm.BoardID
    AND bm.UserID = u.UserID
    AND b.BoardName = 'Product Launch'
;
#*/
#5. Modify your solution to Q4 by adding a column “board owner” and list “yes” or “no” for each member as appropriate.
/* *** Gusta Bexon not returning 'Yes' ****
SELECT b.BoardID, b.BoardName, CONCAT(u.Fname, ' ', u.Sname) 'Board Member Names', IF(bm.UserID = bo.UserID, 'Yes', 'No') 'Board Owner'
	FROM board b, `user` u, board_member bm, board_owner bo
    WHERE b.BoardID = bm.BoardID
    AND b.BoardID = bm.BoardID
    AND bm.UserID = u.UserID
    AND b.BoardName = 'Product Launch'
    GROUP BY u.UserID
;
#*/
#6. Display the names of people who have been invited to the “Product launch” board, but have not accepted the invitation.
/*
SELECT CONCAT(Fname, ' ', Sname) 'Invite to Product Launch not accepted'
	FROM `user`u, board_invite bi, board b
    WHERE b.BoardID = bi.BoardID
    AND bi.Email = u.Email
    AND b.BoardName = 'Product Launch'
    AND bi.InviteAccepted = 0
;
#*/
#7. Modify your solution to Q6 to also show the person who invited the members who didn’t accept the invitation to join the “Product launch” board.
/*
SELECT CONCAT(u1.Fname, ' ', u1.Sname) 'Invite to Product Launch not accepted', CONCAT(u2.Fname, ' ', u2.Sname) 'Invite issued by'
	FROM `user`u1, `user`u2, board_invite bi, board b
    WHERE b.BoardID = bi.BoardID
    AND bi.Email = u1.Email
    AND bi.UserID = u2.UserID
    AND b.BoardName = 'Product Launch'
    AND bi.InviteAccepted = 0
;
#*/
#8. For each card on the board with the name “Product launch”, list the details of the card, the title of the column it is on, who created the card and member(s) that the card is assigned to.
/*
SELECT cd.*, cn.ColumnTitle, CONCAT(u1.Fname, ' ', u1.Sname) 'Card Creator', GROUP_CONCAT(u2.Fname, ' ', u2.Sname) 'Member(s) Assigned To'
	FROM board b, card cd, `column` cn, card_assignment ca, `user`u1, `user`u2
    WHERE b.BoardID = cn.BoardID
    AND cn.ColumnID = cd.ColumnID
    AND cd.CardID = ca.CardID
    AND cd.Creator = u1.UserID
    AND ca.UserID = u2.UserID
    AND b.BoardName = 'Product Launch'
    GROUP BY cd.CardID
;
#*/
#9. For each card that has one or more checklists, list the Card ID, Card title, Due date and any corresponding check lists (list title and list items). 
#	Also list if the check list items are completed or not by specifying “Completed” or “No” cards and the team member assigned to the task.
/*
SELECT cd.CardID 'Card ID', cd.CardTitle 'Card Title', cd.DueDate 'Due Date', cl.Title 'Checklist Title', cli.ItemText 'Checklist Item',
		IF(cli.Completed, 'Completed', 'No') 'Item Completed', CONCAT(u.Fname, ' ', u.Sname) 'Assigned Staff'
	FROM board b, `column` cn, card cd, check_list cl, check_list_item cli, `user` u
    WHERE b.BoardID = cn.BoardID
    AND cn.ColumnID = cd.ColumnID
    AND cd.CardID = cl.CardID
    AND cl.CheckListID = cli.CheckListID
    AND cli.AssignedTo = u.UserID
	ORDER BY cd.CardID
;
#*/    
#10. List the cards (ID, title, card title, column title), the card creator and assigned staff on the board “Product launch” that have not been completed. 
/*
SELECT DISTINCT cd.CardID, cd.CardTitle 'Card Title', cn.ColumnTitle 'Column Title', CONCAT(u1.Fname, ' ', u1.Sname) 'Card Creator', GROUP_CONCAT(DISTINCT u2.Fname, ' ', u2.Sname) 'Assigned Staff'
	FROM card cd, `Column` cn, check_list cl, check_list_item cli, board b, labelled_cards lc, card_label cdl, `user`u1, `user`u2
    WHERE b.BoardID = cn.BoardID
    AND cn.ColumnID = cd.ColumnID
    AND cd.CardID = cl.CardID
    AND cl.CheckListID = cli.CheckListID
    AND cli.Completed != cl.CheckListID
    AND cd.Creator = u1.UserID
    AND cli.AssignedTo = u2.UserID 
    AND b.BoardName = 'Product Launch'
    GROUP BY cd.CardID
;
#*/

#11.For each person on the board “Product launch”, list the number of cards assigned to them. List by the total number of cards from highest to lowest.
/*
SELECT CONCAT(u.Fname, ' ', u.Sname) `Staff Name`, COUNT(ca.CardID) `Total Cards Assigned`
	FROM board b, `column` cn, card cd, card_assignment ca, `user`u
    WHERE b.BoardID = cn.BoardID
    AND cn.ColumnID = cd.ColumnID
    AND cd.CardID = ca.CardID
    AND ca.UserId = u.UserID
    AND b.BoardName = 'Product Launch'
    GROUP BY `Staff Name`
    ORDER BY `Total Cards Assigned` DESC
;
#*/
#12. List the Card ID, card name and description of all cards that are not labelled.
/*
SELECT cd.CardID 'Card ID', cd.CardTitle 'Card Name', cd.`Description`
	FROM card cd
	LEFT OUTER JOIN labelled_cards lc
	ON cd.CardID = lc.CardID
    WHERE lc.CardID IS NULL;
#*/