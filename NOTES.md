## NOOOTES

- Genre colors. Each genre of music has it's own color.
- Site Logo/colors for each listing. Figure out where the link is from.
- How many plays/clicks does a track have?
- Comments/discussion or even just a basic chat?
- Tweet, share, etc...

## Random Thoughts

- Tweet when someone shares a track?

## TODO!

- genres and stuff
- get the track title from the link with JS or something.
- add unique constraints to the stuffs
- consider adding tokens to the session instead of just the plain user id. Hint: `Phoenix.Token.sign/3` and `Phoenix.Token.verify/3`
- add `image_url` field to user
- add `provider` field to track, to determine what image to show on the front-end.
- this.


## DEV NOTES

**Track Schema Ideas**

- name
- user_id: person who posted the track
- link: only allow urls from soundcloud, youtube, and spotify. Should be embeddable.
- genre_id