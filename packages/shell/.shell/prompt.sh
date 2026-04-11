
function git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')

  if [[ -z $branch ]]; then
    return
  fi

  if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
    echo "($branch*) "
  else
    echo "($branch) "
  fi
}

setopt prompt_subst

prompt='%F{cyan}%t %F{green}%n %f%2/ %F{magenta}$(git_branch_name)%f%(!.#.$) '
