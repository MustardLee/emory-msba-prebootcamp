--1.
select count(*)
from dbo.shipments

--2.
select min([Ship Date]) as min_ship_date, max([Ship Date]) as max_ship_date
, avg([Weight]) as avg_weight
from dbo.shipments

--3.
select count(*)
from dbo.Shipments
where mode = 'LTL'

--4.
select count(distinct [Origin Zip])
from dbo.Shipments


--5.
select count(*)
from dbo.Shipments
where Weight between 100 and 250


--6.
select AVG(cast(Pallets as float))
from dbo.Shipments
where Weight < 500
and mode = 'LTL'


--7.
select format(cast([Ship Date] as date),'yyyy/MM') as mth, count(*) as cnt
from dbo.Shipments
group by format(cast([Ship Date] as date),'yyyy/MM')
order by 1

--8.
select count(distinct [Origin City])
from dbo.Shipments
where [Origin City] = [Destination City]


--9.
select [Origin City], avg([Weight])
from dbo.Shipments
group by [Origin City]
order by avg([Weight]) desc


--10.
select [ID Number], [Origin City]
from dbo.Shipments
where [Origin City] like '%City'


--11.
select distinct First_Name, Worker_Title
FROM [dbo].[Title] t_a
left join [dbo].[Workers] t_b
on t_a.Worker_Ref_ID = t_b.Worker_ID
where t_a.Worker_Title = 'Manager'

--12.
select distinct Worker_Ref_ID
from [dbo].[Bonus]
where Bonus_Amount is not NULL


--13.
select distinct a.*, b.Worker_Title
from [dbo].[Bonus] as a 
left join [dbo].[Title] as b 
on a.Worker_Ref_ID = b.Worker_Ref_ID


--14.
SELECT distinct CONCAT([First_Name],' ',[Last_Name]) AS Full_Name, [Bonus_Amount]
from [dbo].[Workers] as a 
left join [dbo].[Bonus] as b 
on a.Worker_ID = b.Worker_Ref_ID
where b.Bonus_Amount > (select avg(cast(Bonus_Amount as float)) from [dbo].[Bonus])


--15. 
SELECT distinct [First_Name]
      ,[Last_Name]
      ,[Worker_Title]
      ,[Salary]
FROM [dbo].[Workers] as a 
left join [dbo].[Title] as b 
on a.Worker_ID = b.Worker_Ref_ID
inner join (select [Department]
            ,max([Salary]) as max_salary
            from [dbo].[Workers]
            group by [Department]
            ) as c 
    on a.Department = c.Department
    and a.Salary = c.max_salary