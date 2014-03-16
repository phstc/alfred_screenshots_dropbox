# Alfred Screenshots to Dropbox Workflow

I love [CloudApp](http://www.getcloudapp.com/), but I don't use it a lot to justify the paid plan, but sometimes I need to upload more than 10 screenshots per day. So, to avoid any annoyance or extra cost, this extension uploads screenshots by pressing `CMD + Shift + 5` to Dropbox.

If you have a [bitly](https://bitly.com/) account, you can use it to shorten the urls. Go to ["Your bitly API Key"](https://bitly.com/a/your_api_key) to get you username and Api key.


## Installation instructions

1. Download & Intall [alfred_screenshots_dropbox.alfredworkflow](https://github.com/phstc/alfred_screenshots_dropbox/raw/master/alfred_screenshots_dropbox.alfredworkflow)
2. Open Alfred Preferences `CMD+Space` then `CMD+,`.
3. Open Workflows.
4. Right click on "Dropbox Screenshots by Pablo Cantero".
5. Show in Finder.
6. Open `config.json` in your favorite editor then fill your dropbox public path, user_id and bitly if you want to shortener the urls.

### Dropbox user_id

Easiest way to find one's Dropbox user_id is to right click on a file in the Public folder, copy the link, then paste into an editor.

The link looks like: http://dl.dropbox.com/u/#######/filename.txt

Where the #'s are your Dropbox user_id.

## config.json

```json
{
  "dropbox_folder":  "/Users/pablo/Dropbox/Public/Screenshots",
  "dropbox_user":    "1234567",
  "bitly_user":      "",
  "bitly_key":       ""
}

```

## Usage

* Make sure your [Dropbox App](https://www.dropbox.com/install) is up & running.
* Press `CMD + Shift + 5` to take selective screenshots.


