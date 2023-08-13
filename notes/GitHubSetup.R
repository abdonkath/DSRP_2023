## set your name and email
usethis::use_git_config(user.name = "Mari Kathleen Abdon",
                        user.email = "email_for_kathabdon06@gmail.com")
## create a personal acces token (PAT) for authenthication
usethis::create_github_token()

##set personal access token
credentials::set_github_pat("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")

