import requests
import os

# GitHub API base URL
base_url = "http://api.github.com/orgs/SeleniumHQ/repos"
open_issues_count = 0
repositories = []

# Fetch repositories
os.environ['NO_PROXY'] = 'api.github.com'
response = requests.get(base_url)
repos = response.json()
print(repos)

for repo in repos:
    open_issues = repo.get('open_issues_count', 0)
    updated_at = repo.get('updated_at')
    watchers_count = repo.get('watchers_count', 0)
    
    open_issues_count += open_issues
    repositories.append({
        'name': repo['name'],
        'updated_at': updated_at,
        'watchers_count': watchers_count
    })

# Sort repositories by updated_at in descending order
repositories.sort(key=lambda x: x['updated_at'], reverse=True)

# Identify the repository with the most watchers
most_watchers_repo = max(repositories, key=lambda x: x['watchers_count'])

# Output the results
print(f"Total number of open issues across all repositories: {open_issues_count}")
print("\nRepositories sorted by updated_at (descending):")
for repo in repositories:
    print(f"- {repo['name']} (Last Updated: {repo['updated_at']})")

print(f"\nRepository with the most watchers: {most_watchers_repo['name']} with {most_watchers_repo['watchers_count']} watchers")