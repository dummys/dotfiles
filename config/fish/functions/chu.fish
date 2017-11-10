function chu
	echo -e "\n* Checking the repos *\n"; checkupdates; echo -e "\n\n* Checking the AUR *\n"; cower -dduf --color=auto --timeout=0; echo -e "\nDone\n"
end
