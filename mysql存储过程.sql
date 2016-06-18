
DROP procedure  if exists processorders ;
DROP procedure  if exists rocessorders1 ;

CREATE PROCEDURE rocessorders1()
   begin
	declare num int;
	declare oid int;
	set num=160;
	while(num<350) do
		insert into  a (name) values(concat('vlstest',num));
		set num=num+1;
	end while;
   end;
CALL rocessorders1;
select * from a;
DROP procedure  if exists processorders ;
DROP procedure  if exists rocessorders1 ;
	
CREATE PROCEDURE processorders()
        BEGIN
			 -- 声明局部变量
			declare stop int default 0;
            DECLARE done BOOLEAN DEFAULT 0;
			DECLARE mdsl VARCHAR(255); 
			DECLARE data1 date;
            DECLARE ordernumbers CURSOR
            FOR
            SELECT name FROM a;
			DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET stop = null;
			Open ordernumbers ;
			set data1 = now();
            
			WHILE ( stop is not null) DO

				
				set data1=data1+1 ;
				INSERT INTO b (name,date) VALUES(mdsl,data1); 
				
				/*游标向下走一步*/
				FETCH ordernumbers INTO mdsl;
      
			END WHILE;
			
            Close ordernumbers ;  
        END;
		
CALL processorders;		
select * from b;