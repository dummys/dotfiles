#!/usr/bin/env fish
set PROG 'gopass'

function __fish_gopass_needs_command
    set -l cmd (commandline -opc)
    if [ (count $cmd) -eq 1 -a $cmd[1] = $PROG ]
	return 0
    end
    return 1
end

function __fish_gopass_uses_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
	if [ $argv[1] = $cmd[2] ]
	    return 0
	end
    end
    return 1
end

function __fish_gopass_print_gpg_keys
    gpg2 --list-keys | grep uid | sed 's/.*<\(.*\)>/\1/'
end

function __fish_gopass_print_entries
    eval "gopass ls --flat"
    for file in $files
	echo "$file"
      end
end

complete -c $PROG -e
complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a help -d 'Command: show usage help'
complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a version -d 'Command: show program version'

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a init -d 'Command: initialize new password storage'
complete -c $PROG -f -A -n '__fish_gopass_uses_command init' -s p -l path -d 'Assign gpg-id for specified sub folder of password store'

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a ls -d 'Command: list passwords'
complete -c $PROG -f -A -n '__fish_gopass_uses_command ls' -a "(__fish_gopass_print_entry_dirs)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a insert -d 'Command: insert new password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command insert' -s e -l echo -d 'Echo the password on console'
complete -c $PROG -f -A -n '__fish_gopass_uses_command insert' -s m -l multiline -d 'Provide multiline password entry'
complete -c $PROG -f -A -n '__fish_gopass_uses_command insert' -s f -l force -d 'Do not prompt before overwritting'
complete -c $PROG -f -A -n '__fish_gopass_uses_command insert' -a "(__fish_gopass_print_entry_dirs)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a generate -d 'Command: generate new password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command generate' -s n -l no-symbols -d 'Do not use special symbols'
complete -c $PROG -f -A -n '__fish_gopass_uses_command generate' -s c -l clip -d 'Put the password in clipboard'
complete -c $PROG -f -A -n '__fish_gopass_uses_command generate' -s f -l force -d 'Do not prompt before overwritting'
complete -c $PROG -f -A -n '__fish_gopass_uses_command generate' -s i -l in-place -d 'Replace only the first line with the generated password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command generate' -a "(__fish_gopass_print_entry_dirs)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a mv -d 'Command: rename existing password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command mv' -s f -l force -d 'Force rename'
complete -c $PROG -f -A -n '__fish_gopass_uses_command mv' -a "(__fish_gopass_print_entries)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a cp -d 'Command: copy existing password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command cp' -s f -l force -d 'Force copy'
complete -c $PROG -f -A -n '__fish_gopass_uses_command cp' -a "(__fish_gopass_print_entries)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a rm -d 'Command: remove existing password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command rm' -s r -l recursive -d 'Remove password groups recursively'
complete -c $PROG -f -A -n '__fish_gopass_uses_command rm' -s f -l force -d 'Force removal'
complete -c $PROG -f -A -n '__fish_gopass_uses_command rm' -a "(__fish_gopass_print_entries)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a edit -d 'Command: edit password using text editor'
complete -c $PROG -f -A -n '__fish_gopass_uses_command edit' -a "(__fish_gopass_print_entries)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a show -d 'Command: show existing password'
complete -c $PROG -f -A -n '__fish_gopass_uses_command show' -s c -l clip -d 'Put password in clipboard'
complete -c $PROG -f -A -n '__fish_gopass_uses_command show' -a "(__fish_gopass_print_entries)"

# Default to show
complete -c $PROG -f -A -n '__fish_gopass_needs_command' -s c -l clip -d 'Put password in clipboard'
complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -A -n '__fish_gopass_uses_command -c' -a "(__fish_gopass_print_entries)"
complete -c $PROG -f -A -n '__fish_gopass_uses_command --clip' -a "(__fish_gopass_print_entries)"

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a git -d 'Command: execute a git command'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'init' -d 'Initialize git repository'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'status' -d 'Show status of the repo'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'add' -d 'Add changes to the index'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'commit' -d 'Commit changes to the repo'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'push' -d 'Push changes to remote repo'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'pull' -d 'Pull changes from remote repo'
complete -c $PROG -f -A -n '__fish_gopass_uses_command git' -a 'log' -d 'View changelog'

complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a find -d 'Command: find a password file or directory matching pattern'
complete -c $PROG -f -A -n '__fish_gopass_needs_command' -a grep -d 'Command: search inside of decrypted password files for matching pattern'
