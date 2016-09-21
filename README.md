# Url Shortener

This app allows users to submit URLs to create shortened versions.
The shortened URL redirects to the original URL when visited.

The site is deployed at https://ur-.herokuapp.com/
Rails version 4.1.4 
Postgres DB

###Overcoming challenges
- The first challenge was deciding how to come up with a short url scheme which I will discuss below.

- How to redirect all specified traffic to a certain `Controller#Action`. In this case, I used `get '*path', to: 'urls#redirect'` in `routes.rb` to send all traffic with a path to the `redirect` action in my `Urls` controller.

- Now the app is successfully redirecting all traffic, but I still had to find a way to grab the URL path to match it with the database. This was achieved calling the `original_url` method on `request`.

###The short URL scheme
- I initially thought about simply creating an array [1..999999], shuffling it, and using the `pop` method to assign the last integer as the URL path. Ultimately I decided against this because it doesn't scale well (it can only handle 1 million URLs). I decided to go with a six character base64 path to solve the scale limitations. Unlike the first solution, a base64 generator has the possibility (however improbable) of not being unique. I solved this by building a method to check the db for all previously stored base64 strings. 
- To achieve the short url: create table with `long_form` url and `short_form` url, generate random base64 string, check uniqueness of string, store in db as `short_form` url path.

###Future Improvements
- Check to make sure the submitted URL is valid.
- Add JavaScript so that the visit count updates without having to reload the page.