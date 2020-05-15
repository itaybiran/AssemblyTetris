IDEAL
MODEL small
STACK 100h

DATASEG


CODESEG

	include 'data.asm' ; מאפשר גישה לקובץ המשתנים של התוכנית
	include 'proc.asm' ; מאפשר גישה לקובץ הפרוצדורות הכללי של התוכנית
	include 'int.asm' ; מאפשר גישה לקובץ המכיל את הפסיקות השימושיות
	include 'draw.asm' ; מאפשר גישה לקובץ שאחראי על ציור הדברים בתכנית
	include 'stats.asm' ; מאפשר גישה לקובץ הפרוצדורות שאחריות על הניקוד
	include 'cubes.asm' ; מאפשר גישה לקובץ שיוצר את הקוביות
	include 'music.asm' ; מאפשר גישה לקובץ שאחראי על המוזיקה
	include 'screen.asm' ; מאפשר גישה לקובץ שאחראי על המסכים
	include 'mode.asm' ; מאפשר גישה לקובץ שאחראי על הדברים המיוחדים בכל מוד
	include 'mouse.asm' ; מאפשר גישה לקובץ שאחראי על כל הנוגע לעכבר
	
start:
	call begin ;מאפס הכל
	call Game ;Starts the game...

exit:
	call escape ;יוצא מהריצה

END start 