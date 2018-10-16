
---To select the total number of checkouts per book in checkouts for a year
select o.ISBN, count(BTKey) as NumberOfCheckouts
from CheckoutTransactionArchive c Left join OMNI o on c.ItemID = o.BTKey
where cast(ActionStartDate as Date) between '20170701' and '20180630'
group by ISBN
order by NumberOfCheckouts DESC


---To select the total number of books checked out per user for a year 
select PatronID, count(ID) as NumberOfCheckouts
from CheckoutTransactionArchive 
where cast(ActionStartDate as Date) between '20170701' and '20180630'
group by PatronID
order by NumberOfCheckouts DESC

---To select the number of book-word counts
select e.ReadNowProductID, r.Isbn, sum(e.WordCount) as totalwordcount
from ReadNowProductEntry e join ReadNowProduct r on e.ReadNowProductID = r.ReadNowProductID
group by e.ReadNowProductID, r.Isbn
order by totalwordcount DESC

---To select the number of words per user
select PatronID, sum(TotalWordCount) as totalwordcount
from PatronReadingData
where cast(SessionDate as Date) between '20170701' and '20180630'
group by PatronID
Order by totalwordcount DESC


---To select the number of words per user per book 
select PatronID, ISBN, sum(TotalWordCount) as wordsread
from PatronReadingData
where cast(SessionDate as Date) between '20170701' and '20180630'
group by PatronID, ISBN
Order by wordsread DESC

