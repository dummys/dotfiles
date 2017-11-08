set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set mtx (set_color 4CFF00)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  set last_status $status

  switch $USER

      case root toor

          printf ' ('
          set_color red
          echo -n -s "$USER"
          set_color normal
          printf '@'
          set_color red
          echo -n (prompt_hostname)
          set_color normal
          printf ')'
          set_color BDBDBD
          printf ' [%s]' (prompt_pwd)
          set_color normal

          printf '%s ' (__fish_git_prompt)
          set_color normal

          printf '[%s]' (date "+%H:%M:%S")
          echo
          set_color red
          echo -n '-> $ '

    case '*'
        
 
          printf ' ('
          set_color 4CFF00
          echo -n -s "$USER"
          set_color normal
          printf '@'
          set_color 4CFF00
          echo -n (prompt_hostname)
          set_color normal
          printf ')'
          set_color BDBDBD
          printf ' [%s]' (prompt_pwd)
          set_color normal

          printf '%s ' (__fish_git_prompt)
          set_color normal

          printf '[%s]' (date "+%H:%M:%S")
          echo
          set_color red
          echo -n '-> $ '
 end
end
