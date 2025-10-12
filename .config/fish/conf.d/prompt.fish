function fish_prompt
   printf '-> %s%s%s%s $ ' \
    (set_color $fish_color_cwd) (prompt_pwd | string split /)[-1] (set_color normal) (fish_git_prompt)
end
