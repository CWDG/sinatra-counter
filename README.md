# Sinatra Page View Counter

It would probably be *very* helpful if you looked at the [Sinatra documentation]() before attempting this project if you are unfamiliar with Sinatra.

## Challenge

Make a simple Sinatra server that will increment a count whenever the site is visited. You can take this as far as you want, but it must:
- Increment the count every time a person visits the page
- Display the count somewhere

## Setup

After cloning this repo, simply go into the directory where you cloned it and run:

```bash
$ bundle
```

## Running the server

Run the server with:

```bash
$ ruby app.rb
```

## Bonus points

Here are some ideas for making this cooler:
- [Add some content in a view](http://www.sinatrarb.com/intro.html#Views%20/%20Templates)! I'd recommend using [ERB](http://www.sinatrarb.com/intro.html#Erb%20Templates), since it's just HTML that will let you put Ruby in it.
- Add more routes! Have them do different things.
- Persist the count to a database (such as SQLite or PostgreSQL) or a key-value store (such as Redis).
