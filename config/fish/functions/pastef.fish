function pastef
	cat $argv | curl -F c=@- https://ptpb.pw | grep -i "url" |  cut -d" " -f 2 | xargs qutebrowser --target window
end

