# Define the top-level directory (TLD) where diffs will be stored; configurable but defaults to /tmp
TLD=${TLD:-"/tmp"}

# Alias to git command to simply protect against `git reset --hard` (and others in the future)
git() {
    # TODO: Only support `git reset --hard` for now, but need to add others in the future (e.g. git clean -f)
    if [[ $1 == "reset" ]] && [[ $2 == "--hard" ]]; then
        # Get the name of the current git repository
        local repo_name=$(basename $(git rev-parse --show-toplevel))

        # Ensure the directory exists
        mkdir -p "$TLD/$repo_name"

        # Save the git diff to a file in the TLD/repo_name directory
        command git diff HEAD >"$TLD/$repo_name/reset$(get_reset_number $repo_name).diff"
        command git "$@"
        echo "Running additional commands"
    else
        command git "$@"
    fi
}

# Allow storring multiple diffs until cleanup or a reset
get_reset_number() {
    # Get the name of the current git repository
    local repo_name=$1

    # Get the last saved resetXX.diff file
    local last_reset=$(ls $TLD/$repo_name/reset*.diff 2>/dev/null | sort -V | tail -n1)

    # If there are no existing files, start at 1
    if [ -z "$last_reset" ]; then
        echo "1"
    else
        # Increment the number in the last file name
        local number=$(echo $last_reset | grep -Po '(?<=reset)[0-9]+(?=.diff)')
        echo "$((number + 1))"
    fi
}
