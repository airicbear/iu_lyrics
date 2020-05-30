# IU Lyrics <img src="./assets/launcher.png" width="64" alt="App icon">

A clean and simple lyrics app for [IU's songs](https://en.wikipedia.org/wiki/List_of_songs_written_by_IU).

This app shows songs of which their **lyrics may not have been added yet**. If you are interested in contributing these lyrics please [submit an issue](https://github.com/airicbear/iu-lyrics/issues) or refer to the [How I add lyrics](#How-I-add-lyrics) section and [create a pull request](https://github.com/airicbear/iu-lyrics/pulls).

## Installation

If you are interested installing the latest version of this app please visit [this project's releases page](https://github.com/airicbear/iu-lyrics/releases/latest) and download the `.apk` file.
This app is **not officially released on the [Google Play Store](https://play.google.com/store/search?q=iu%20lyrics)**.
See the [disclaimer](#Disclaimer) for more details.

## Screenshots

[<img src="./assets/screenshots/home.png" alt="Home page screenshot" width="270" height="480">](./assets/screenshots/home.png)
[<img src="./assets/screenshots/album.png" alt="Album page screenshot" width="270" height="480">](./assets/screenshots/album.png)
[<img src="./assets/screenshots/song.png" alt="Song page screenshot" width="270" height="480">](./assets/screenshots/song.png)

## Lyrics Resources

These are some of the websites I use to find the lyrics:

- [AZLyrics](https://www.azlyrics.com/i/iu.html)
- [ColorCodedLyrics](https://colorcodedlyrics.com/2018/02/iu-aiyu-lyrics-index)
- [Genius](https://genius.com/artists/Iu)
- [YouTube](https://www.youtube.com/results?search_query=iu+lyrics)

## How I add album cover art

1. Look for the album cover art online and download it.

2. Use [ImageMagick](https://imagemagick.org/index.php) to convert the image to 128x128. E.g., `convert eight.jpg -resize 128x128 eight_128.jpg`. Depending on how you installed ImageMagick, you may need to use `magick convert` instead.

3. Add the new `eight_128.jpg` to the `assets/cover_art` folder.

## How I add lyrics

This is generally the process I use for adding lyrics.
However on some websites the text is not as nicely formatted in which case I need to edit it manually.

1. Open the `assets/iu.json` file.

2. Create a new album above the most recent one by following this specific format, e.g.

    ``` json
    {
        "album": "eight",
        "date": "2020-05-06",
        "coverArt": "assets/cover_art/eight_128.jpg",
        "songs": [
            {
                "title": "eight",
                "lyrics": {
                    "han": [],
                    "rom": [],
                    "eng": []
                }
            }
        ]
    },
    ```

3. Find the lyrics online. Refer to the [Lyrics Resources](#Lyrics-Resources) section.

4. Copy the Korean (Hangul) lyrics into a new file buffer in [Visual Studio Code](https://code.visualstudio.com/). (In Visual Studio Code, just click on `File -> New File` or type `Ctrl+N`)

5. Add a new line to the end of the file if there isn't one.

6. On the last line of the lyrics, go to the end of the line and hold down the `Shift` Key and then hit the Right Arrow Key once. This should highlight a single space after the line and then place the cursor on the next line.

7. Hold down `Ctrl+D` until every line is highlighted. This will allow you to edit each line simultaneously.

8. Now, just hit the Left Arrow Key once and add a double-quote and comma, e.g. `",` and then use the `Home` Key to jump to the beginning of the line and add the opening double-quote `"`.

9. Hit the `Esc` Key and delete the last line's comma.

10. Add the formatted Hangul lyrics into the brackets of `"han": []`.

11. Repeat the same procedure for the Roman and English lyrics starting at step 4, adding the corresponding lyrics to `"rom": []` and `"eng": []`.

The lyrics should look something like this (without the `...`) when everything is properly formatted (example lyrics: ["Boo" by IU from Genius](https://genius.com/Iu-boo-lyrics)):

``` json
"Think about it (IU) check it check (IU)",
"Boo boo boo True color present",
"",
"내가 별로라는 외몰 갖고 있는 너라고",
"많이 안 좋아하는 버릇도 모조리 다 갖추고 있어",
"어쩜 스치기만 해도 엄청나게 싫은 얼굴로 (No)",
"널 쳐다봤어 (미안하긴 했어)",
...
"Boo"
```

Each line represents a [`Card`](https://api.flutter.dev/flutter/material/Card-class.html) in Flutter.
The empty line `"",` then represents an empty `Card` which is used to separate each section of the song.

## Environment Setup

1. Install [OpenJDK 8](https://openjdk.java.net/) (`sudo apt install openjdk-8-jdk`) **Note:** Java 8 is my recommended version for Flutter projects as of May 2020
2. Make sure Java is installed by running `java -version`, if it doesn't work then you may need to add `java` to your `PATH`
4. Install [Flutter](https://flutter.dev/docs/get-started/install) and make sure it's on your `PATH`
6. Run `flutter doctor --android-licenses` and accept all licenses
7. Verify everything is good by running `flutter doctor`
8. Clone the repository via `git clone https://github.com/airicbear/iu-lyrics`

### Android Studio

1. Install [Android Studio](https://developer.android.com/studio/)

2. Install the Flutter plugin for Android Studio.

3. Add Dart SDK to Android Studio from your Flutter installation (e.g. `~/development/flutter/bin/cache/dart-sdk/`)

For more information, [visit the Flutter documentation on setting up Android Studio for Flutter development](https://flutter.dev/docs/get-started/editor?tab=androidstudio).

### Visual Studio Code

1. Install [Visual Studio Code](https://code.visualstudio.com/).

2. Install the [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) and [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) plug-ins for Visual Studio Code.

For more information, [visit the Flutter documentation on setting up Visual Studio code for Flutter development](https://flutter.dev/docs/development/tools/vs-code).

## Installing

This will build an `app.apk` at `build/app/outputs/release/`:

``` sh
flutter build apk --split-per-abi
```

Then to install the latest build to your device just do:

``` sh
flutter install
```

## Disclaimer

### Content rights

There is an app on the Google Play Store called [IU 🎵 Lyrics (Offline) by Asmody](https://play.google.com/store/apps/details?id=com.asmody.iulyrics&hl=en_US).
I am not affliated with the publisher whatsoever and I do not know their motivation in publishing my app to the Play Store.
However their page on the Play Store includes an important disclaimer that applies to this app:

> This is an unofficial fan-made app.
> This fan app and its content are not officially endorsed or produced by, nor associated with or affiliated with the music artist(s) or any associated entities of the artist(s), such as management or record label.
> All trademarks and copyrights are property of their respective owners.
> Please support the artists by buying their songs or their ringtones.
> Any content used is used at a fan-base stand point.
Artist and album artwork is used solely for promotion of the lawful retail sale of recorded music as ringtones, and no endorsement or sponsorship of our company or > its products by any musical artists or other parties is expressed or implied.
> Artist names are for identification purposes only. Applicable fees are paid for all ringtone downloads through a license from the appropriate music publishers.
> The developer is a curator and aggregator providing easy access to publicly available content.
> Lyrics displayed by the fan app are property of their respective owners and may only be used for educational purposes.

### Content quality

I do not know Korean and therefore cannot verify the quality of the lyrics and/or translations of the lyrics.
If you find that some lyrics are wrong, please [submit an issue](https://github.com/airicbear/iu-lyrics/issues) specifying which lyrics are wrong and your sources for the correct lyrics.
