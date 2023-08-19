:# bash script training
#!bin/bash/
: '
set -x;
set -e;
set -o;

'
#set nohlsearch;

test =10**9;

while [ test!=0 ]
do
echo '====================================================='
echo ''
echo Select 0 to quit program
echo Select 1 to identify user
echo Select 2 add a new user
echo Select 3 to delete a user
echo Select 4 to block a user
echo Select 5 to un-block a user
echo Select 6 to add user to existing Group
echo Select 7 to identify users in a Group
echo Select 8 to add a Group to your instance
echo Select 9 to delete a Group from your instance
echo Select 10 to check  if a  user has  sudo priviledges
echo Select 11 to grant sudo access to a user
echo Select 12 to change timezone of your server
echo ''
echo '====================================================='
echo ''

# selecting respectively action based on choice above


read choice;

case $choice in
	## this section breaks program
	 0) break ;;

	## this section idenyifies current user 
	1)echo I am $(whoami) user !.;;

	#############################################################################################################

	## this section adds new user to the server
	
	
	2) echo please type the your name:
	read type_name;
	sudo adduser $type_name;	
        sudo passwd $type_name;

        echo $type_name user added;

	## check the added user
	echo the user info in the etc/passwd:
	echo''
	tail /etc/passwd | grep $type_name; ;;
	 
	####################################################################################################################
      ## delete a user
      3) echo Please type the username you want to delete:
         read type_name1;
	 echo ''

   echo Please are you sure you want to delete user $type_name1  yes/no?:
   echo ''
   echo ''
    read con;

   ## if condition statements to check the whether the right name is type in

   if  [  "$con" == 'yes' ]  || [ "$con"  == 'y' ]  ||  [ "$con"  == 'Y' ]  || [ "$con" == 'YES' ]  || [ "$con"  == 'Yes' ];
	
 then


## checking if  input user exists

ttyu=`cat /etc/passwd | cut -d: -f1 | grep $type_name1`;

if [ "$type_name1" == "$ttyu"  ];
then
	 
    sudo userdel -r $type_name1;
  echo The user $type_name1 has been deleted successfully !!!

else
 echo The username $type_name1 you entered doesn\'t exist;
   echo Please check the spellings and try again;
echo ''

fi

else  

	echo $(whoami), the user $type_name1 still alive !!;
continue;	

fi ;;
##############################################################################################################################
## block a user
   
   4) 
   echo Please type the username you want to block:
         read type_name9;
         echo ''

   echo Please are you sure you want to block user $type_name1  yes/no?:
   echo ''
    read con9;

   ## if condition statements to check the whether the right name is type in   
   
   if  [  "$con9" == 'yes' ]  || [ "$con9"  == 'y' ]  ||  [ "$con9"  == 'Y' ]  || [ "$con9" == 'YES' ]  || [ "$con9"  == 'Yes' ];

 then
  
## checking if  input user exists

tt4=`cat /etc/passwd | cut -d: -f1 | grep $type_name9`;

if [ "$type_name9" == "$tt4"  ];

  then
   sudo usermod -L $type_name9;

  echo The user $type_name9 has been blocked successfully !!!;

else

   echo The username $type_name9 you entered doesn\'t exist;
   echo Please check the spellings and try again;
echo '' 

fi

 else

        echo $(whoami), the user $type_name9 still alive !!;
continue;


   fi 

;;

#############################################################################################################################
   5)
   echo Please type the username you want to un-block:
         read type_name10;
         echo ''

## checking if  input user exists

tt3=`cat /etc/passwd | cut -d: -f1 | grep $type_name10`;

if [ "$type_name10" == "$tt3"  ];

then
  sudo usermod -U $type_name10;	

 echo The username $type_name10 has been un-blocked successfully;


else
	echo The username $type_name10 you entered doesn\'t exist;
	echo Please check the spellings and try again; 

fi;;


## adding user to existing group
6)#############################################################################################################################
echo Please enter the user name:
read type_name2;
 echo ''
 echo Please enter the group name:
 read type_group1;
## checking if  input user exists
 
tt=`cat /etc/passwd | cut -d: -f1 | grep $type_name2` ;

## checking with the if statements

if [ "$type_name2" == "$tt"  ];

then

 ## checking if the group entered exists
 
tt_2=`cat /etc/group | cut -d: -f1 | grep $type_group1` ;

 
if  [ "$type_group1" == "$tt_2"  ];


then
	sudo usermod -aG $type_group1  $type_name2;
	echo  The user $type_name2  added to group $type_group1 successfully; 

else

 echo $type_group1 not found in group list. Please create group $type_group1 ;
 
 continue


fi 

 else
	 echo $type_name2 not found in users list. Please add user $type_name2 ;

	 continue;

fi  ;;


## checking for users in existing Group
#####################################################################################################################
7)
 echo ''
 echo Please enter the group name:
 read type_group2;  
#echo lists of users in Group $type_group2 :

  # echo grep  '^$type_group2' /etc/group  | cut -d: -f1;
 
  ttr=$(cat /etc/group | grep $type_group2);


 if [ $ttr !=  ' ' ] 

 then

echo lists of users in Group $type_group2 :

echo ' '

  echo $ttr;

  echo ' '

else

    echo The group $type_group2 cannot be found !!
    echo Please create $type_group2 first before this action !!
    echo ' '


 fi
   
   ;;


   ## adding Group to your instance
########################################################################################################################
8) 

echo Please enter the new group name:
read type_group5;
 sudo groupadd $type_group5;

 echo  Group $type_group5 is created !!;

  cat /etc/group |  grep $type_group5 ; 
  

;;
#########################################################################################################################
9) ## deleting a group  from your instance
	echo Please enter the name of the group you want delete:

read type_group5;

 echo Please are you sure you want to delete group $type_group5  yes/no?:
 read con1;

   echo ''
   echo ''


 ## if condition statements to check the whether the right name is type in

   if  [  "$con1" == 'yes' ]  || [ "$con1"  == 'y' ]  ||  [ "$con1"  == 'Y' ]  || [ "$con1" == 'YES' ]  || [ "$con1"  == 'Yes' ];

 then
    sudo groupdel $type_group5;
  echo The group $type_group5 has been deleted successfully !!!


else

        echo $(whoami), the group $type_group5 is still alive !!;
continue;

fi ;;

##########################################################################################################################
## checking if user has sudo privilege

10) 

## checking if  input user exists
echo Please enter the user name:
read type_name7;



tt7=`cat /etc/passwd | cut -d: -f1 | grep $type_name7`;

if [ "$type_name7" == "$tt7"  ];

then


fsd=`sudo -l -U $type_name7 | head  -1 |cut -d ' '  -f 5`;
rt=$(id root |cut -d ' '  -f 1);

fsdt=`sudo -l -U $(whoami) | head  -1 |cut -d ' '  -f 5`;


if [ "$type_name7" == "$fsd" ] && [ "$fsdt" == "$(whoami)" ]
then
	echo The  entered user $type_name7 has sudo priviledges

       echo the current user $(whoami) also has sudo priviledges


elif [ "$type_name7" == "$fsd"  ] && [ "$(whoami)" == "root" ]

then
	echo The  entered user $type_name7 has sudo priviledges

	echo The current user $(whoami)  also has sudo priviledges


#elif  [ "$type_name7" != "$fsd" ] &&  [  "$(whoami)" == "$fsdt" ]

  : 'elif [ "$type_name7" != "$fsd" ] && [ "$(whoami)" == $fsdt ]

	
      #echo The  entered user $type_name7 does not sudo have  priviledges

         echo ''

       echo  Only the current user $(whoami)  has sudo priviledges'
    

   elif [ "$type_name7" != "$fsd" ] && [ "$(whoami)" == "root" ]

then
        #echo The  entered user $type_name7 has sudo priviledges
	echo ''

        echo Only the  current user $(whoami)  has sudo priviledges


  elif [ "$type_name7" != "$fsd" ] 

then
        #echo The  entered user $type_name7 has sudo priviledges
        echo ''

        echo The entered user $type_name7  does not have  sudo priviledges

#else 


fi 

else

 echo The username $type_name7 you entered doesn\'t exist;
  echo Please check the spellings and try again;

fi

;;


######################################################################################################################
#v Granting sudo access/ priviledge to a user

11)
echo granting sudo access !!!!
echo ''
echo Please enter the user name:
read userName;

echo Please are you sure you want to agrant sudo access to user $type_name1  yes/no?:
   echo ''
    read con92;

   ## if condition statements to check the whether the right name is type in

   if  [  "$con92" == 'yes' ]  || [ "$con92"  == 'y' ]  ||  [ "$con92"  == 'Y' ]  || [ "$con92" == 'YES' ]  || [ "$con92"  == 'Yes' ];

 then


## checking if  input user exists

tt_92=`cat /etc/passwd | cut -d: -f1 | grep $userName`;

if [ "$userName" == "$tt_92"  ];
then

sudo echo "$userName ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$userName

echo User $userName has been granted sudo access sucessfully !


else
  echo The username $userName you entered doesn\'t exist;
      echo Please check the spellings and try again;



fi


else
   echo $(whoami), has declined sudo access to $userName !!;

fi

 ;;

###################################################################################################################################

# changing the timezone of your server

12)
echo Changing the timezone to a  specific location.
echo Please ensure type in cities with double names have space between.
echo Please enter the name of city: 

read namw namwp;


stu=`sudo timedatectl list-timezones | grep  $namw`;

echo "$stu";
sudo timedatectl set-timezone $stu;


: '

if [ $# == 1  ] 

then
stu=`sudo timedatectl list-timezones | grep  $namw`;

sudo timedatectl set-timezone '$stu';
sudo timedatectl; 



elif [  $# == 2 ]
then	
stu=`sudo timedatectl list-timezones | grep  $namwp`;

sudo timedatectl set-timezone '$stu';

sudo timedatectl;

else
	echo Please check the spelling of the name city;

fi'



;;






*) echo Please your haVe entered a wrong value!. ;;







esac



done







