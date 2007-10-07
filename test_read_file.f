( -*- text -*-
	Test READ-FILE.
	$Id: test_read_file.f,v 1.1 2007-10-07 11:07:15 rich Exp $
)

0 VALUE FD
100 CELLS ALLOT CONSTANT BUFFER

: TEST
	S" /etc/fstab" R/O OPEN-FILE
	?DUP IF S" /etc/fstab" PERROR QUIT THEN

	TO FD

	BEGIN
		BUFFER 100 CELLS FD READ-FILE
		?DUP IF S" READ-FILE" PERROR QUIT THEN
		DUP
		BUFFER SWAP TELL
	0= UNTIL

	FD CLOSE-FILE
	?DUP IF S" CLOSE-FILE" PERROR QUIT THEN
;
