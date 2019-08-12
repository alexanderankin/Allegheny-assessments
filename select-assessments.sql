select * from (SELECT * FROM `afve_ind` limit 100) as voter
join PROPERTYLOCATION pl on pl.PROPERTYHOUSENUM = voter.`House Number` and pl.PROPERTYFRACTION = voter.`House Number Suffix` and pl.PROPERTYADDRESS = voter.`Street Name` and pl.PROPERTYSTATE = voter.`State` and pl.PROPERTYZIP = voter.`Zip`


select
    voter.id,
    voter.`ID Number`,
    voter.`first name` as vfname,
    voter.`last name` as vlname,
    voter.`House Number`,
    voter.`Street Name`,
    voter.`Zip`,
    pl.id
from
    afve_ind as voter
join
    PROPERTYLOCATION pl on
        pl.PROPERTYHOUSENUM = voter.`House Number` and
        pl.PROPERTYADDRESS = voter.`Street Name` and
        pl.PROPERTYZIP = voter.`Zip`
limit 10;



SELECT * FROM `PROPERTYLOCATION` where id > 6783 and id < 6786


select voterhead.*, pl.*, format((a.COUNTYTOTAL * .00473),2) from (SELECT * FROM a_vf_addresses limit 100) as voterhead
join PROPERTYLOCATION pl on pl.PROPERTYHOUSENUM = voterhead.housenumber and
pl.PROPERTYADDRESS = voterhead.streetname and
pl.PROPERTYCITY = voterhead.city and 
pl.PROPERTYZIP = voterhead.zip
join assessments a on a.PROPERTYLOCATIONID = pl.id


select voterhead.*, pl.*, format((a.COUNTYTOTAL * .00473),2) from (SELECT * FROM a_vf_addresses limit 100) as voterhead
join PROPERTYLOCATION pl on pl.PROPERTYHOUSENUM = voterhead.housenumber and
pl.PROPERTYADDRESS = voterhead.streetname and
pl.PROPERTYCITY = voterhead.city and 
pl.PROPERTYZIP = voterhead.zip
join (
    select PROPERTYLOCATIONID, max(countytotal) as COUNTYTOTAL from assessments group by PROPERTYLOCATIONID
) a on a.PROPERTYLOCATIONID = pl.id