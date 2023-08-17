#bash script training
#!bin/bash/

test =100;

while [ test!=0 ]
do
echo '==============================='
echo ''
echo Select 0 to quit program
echo Select 1 to identify user
echo Select 2 add new user
echo Select 3 to add user to a group
echo Select 4 to delect a user
echo Select 6 to identify sudo users
echo ''
echo '==============================='
echo ''

# selecting respectively action based on choice above


read choice;

case $choice in
	## this section breaks program
	 0) break ;;

	## this section idenyifies current user 
	1)echo I am $(whoami) user !.;;


	## this section adds new user to the server
	
	
	2) has_sudo_access=""
printf "mypassword\n" | sudo -S /bin/chmod --help >/dev/null 2>&1
if [ $? -eq 0 ];then
   has_sudo_access="YES"
else
   has_sudo_access="NO"
fi

echo "Does user `id -Gn` has sudo access?: $has_sudo_access"
  
};;	



esac


done


