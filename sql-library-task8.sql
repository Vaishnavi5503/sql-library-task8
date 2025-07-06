-- Use your database
USE LibraryDB;

-- 🔧 Stored Procedure: Get borrow records by a specific Member ID
DELIMITER //
CREATE PROCEDURE GetBorrowsByMember(IN member_id INT)
BEGIN
    SELECT b.BorrowID, m.Name AS MemberName, bk.Title AS BookTitle, b.BorrowDate
    FROM Borrow b
    JOIN Members m ON b.MemberID = m.MemberID
    JOIN Books bk ON b.BookID = bk.BookID
    WHERE b.MemberID = member_id;
END;
//
DELIMITER ;

-- ✅ Call Example:
-- CALL GetBorrowsByMember(1);

-- 🔧 Stored Function: Count total borrows for a specific Book
DELIMITER //
CREATE FUNCTION GetBorrowCountByBook(book_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE borrow_count INT;
    SELECT COUNT(*) INTO borrow_count
    FROM Borrow
    WHERE BookID = book_id;
    RETURN borrow_count;
END;
//
DELIMITER ;

-- ✅ Call Example:
-- SELECT GetBorrowCountByBook(2) AS BorrowCount;