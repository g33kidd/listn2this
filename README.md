# Info

This project is built to be ran on Heroku or Dokku environments. There are 2 environment variables that need to be set before running on your local machine.

`TWITTER_CONSUMER_KEY` and `TWITTER_CONSUMER_SECRET` for authentication with twitter.

For production:

You need to have `DATABASE_URL` set, or just change the Repo configuration in `config/prod.exs` and `SECRET_KEY_BASE`.

# Listen

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
