SELECT * FROM nashvillehousing;


-- edit the propertyAdress & Add cloums 
select propertyAddress from nashvillehousing;

select 
substring(propertyAddress , 1 , (locate("," , propertyAddress)-1) ) AS Address , 
substring(propertyAddress , (locate("," , propertyAddress)+1) , length(propertyAddress) ) AS Address
from nashvillehousing;

alter table nashvillehousing 
add propertysplitAddress varchar(255) ; 

update nashvillehousing
set propertysplitAddress = (substring(propertyAddress , 1 , (locate("," , propertyAddress)-1)) ); 

alter table nashvillehousing 
add propertyCityAddress varchar(255) ; 

update nashvillehousing
set propertyCityAddress = substring(propertyAddress , (locate("," , propertyAddress)+1) , length(propertyAddress) ); 
/*-----------------*/


-- edit the OwnerAddress & Add cloums 
SELECT OwnerAddress FROM nashvillehousing;
select 
SUBSTRING_INDEX(OwnerAddress , "," , 1 ) AS Address , 
SUBSTR(SUBSTRING_INDEX(OwnerAddress , ","  , 2  ) , locate("," , propertyAddress)+1 , length(OwnerAddress) ) AS City ,
SUBSTRING_INDEX(OwnerAddress , "," , -1  )  AS Stite
from nashvillehousing;

-- Address : 
alter table nashvillehousing 
add Address varchar(255) ; 
update nashvillehousing
set Address = SUBSTRING_INDEX(OwnerAddress , "," , 1 ); 

-- City : 
alter table nashvillehousing 
add City varchar(255) ; 
update nashvillehousing
set City = SUBSTR(SUBSTRING_INDEX(OwnerAddress , ","  , 2  ) , locate("," , propertyAddress)+1 , length(OwnerAddress) ); 

-- Stite : 
alter table nashvillehousing 
add Stite varchar(255) ; 
update nashvillehousing
set Stite =  SUBSTRING_INDEX(OwnerAddress , "," , -1  ); 

/*-----------------*/
-- delate unuse col 

select * from nashvillehousing ;

alter table nashvillehousing 
drop column PropertyAddress  ; 
alter table nashvillehousing 
drop column OwnerAddress;
alter table nashvillehousing 
drop column TaxDistrict;

