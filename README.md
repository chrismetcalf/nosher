I subscribed to [Feedly Premium](http://blog.feedly.com/category/feedly-pro/) for a number of features, especially it's awesome [custom sharing](http://blog.feedly.com/2013/10/07/feedly-pro-introducing-custom-sharing/) function.

I wanted a bit more, starting with adding embedded YouTube videos to my Watch Later queue. This is the beginning of my Feedly magic.

# Configuration

You'll need to export 4 environment variables to your Heroku environment:

* YOUTUBE_DEV_KEY - your developer key from <http://code.google.com/apis/youtube/dashboard>
* YOUTUBE_USERNAME - your username
* YOUTUBE_PASSWORD - your password

Note that *this means you store your username and password in Heroku variables*. Which is idiotic. Don't use this. Seriously.
