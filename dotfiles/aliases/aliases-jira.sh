alias jira-tickets='acli jira workitem search --jql "assignee = currentUser() AND resolution = Unresolved ORDER BY updated DESC" --fields "key,summary,status,priority"'

# My tickets updated in the last 7 days
alias jira-recent='acli jira workitem search --jql "assignee = currentUser() AND updated >= -7d ORDER BY updated DESC" --fields "key,summary,status,priority"'

# View a specific ticket (add --web to view in browser)
alias jira-view='acli jira workitem view'
