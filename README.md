# README

## Description

* App link: https://fast-meadow-88078.herokuapp.com/

```bash
Rails + Bootstrap blog app allowing Bloggers to add their articles and assign them to categories.
```

Two type of users(bloggers):
- admin user,
- normal user.

Admin can:
- modify any article, 
- remove any article,
- remove any user profile,
- edit admin profile.

Normal user can:
- remove only his articles,
- edit only his articles,
- remove only his profile,
- edit only his profile.

Not logged in user can only:
- preview all articles,
- preview all users,
- preview all categories,
- cannot modify anything.

```bash
-------------------------------------------------------
```
* git push heroku master
* heroku run rails db:migrate
* heroku open
* heroku run rails console
