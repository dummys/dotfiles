# Defined in - @ line 0
function mountu --description 'alias mountu sudo mount -o gid=dummys,fmask=113,dmask=002 '
	sudo mount -o gid=dummys,fmask=113,dmask=002  $argv;
end
