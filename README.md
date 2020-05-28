# IU Lyrics <img src="./assets/screenshots/launcher.png" width="64" alt="App icon">

A clean and simple lyrics app for IU's songs.

## Screenshots

[<img src="./assets/screenshots/home.png" alt="Home page screenshot" width="270" height="480">](./assets/screenshots/home.png)
[<img src="./assets/screenshots/album.png" alt="Album page screenshot" width="270" height="480">](./assets/screenshots/album.png)
[<img src="./assets/screenshots/song.png" alt="Song page screenshot" width="270" height="480">](./assets/screenshots/song.png)

## Lyrics Resources

These are some of the websites I use to find the lyrics:

- [AZLyrics](https://www.azlyrics.com/i/iu.html)
- [ColorCodedLyrics](https://colorcodedlyrics.com/2018/02/iu-aiyu-lyrics-index)
- [Genius](https://genius.com/artists/Iu)

## How I add album cover art

1. Look for the album cover art online and download it.

2. Use [ImageMagick](https://imagemagick.org/index.php) to convert the image to 128x128. E.g., `convert eight.jpg -resize 128x128 eight_128.jpg`. Depending on how you installed ImageMagick, you may need to use `magick convert` instead.

3. Add the new `eight_128.jpg` to the `assets/cover_art` folder.

## How I add lyrics

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

4. Copy the Korean (Hangul) lyrics into a new file buffer in [VSCode](https://code.visualstudio.com/). (In VSCode, just click on `File -> New File` or type `Ctrl+N`)

5. Add a new line to the end of the file if there isn't one.

6. On the last line of the lyrics, go to the end of the line and hold down the `Shift` Key and then hit the Right Arrow Key once. This should highlight a single space after the line and then place the cursor on the next line.

7. Hold down `Ctrl+D` until every line is highlighted. This will allow you to edit each line simultaneously.

8. Now, just hit the Left Arrow Key once and add a double-quote and comma, e.g. `",` and then use the `Home` Key to jump to the beginning of the line and add the opening double-quote `"`.

9. Hit the `Esc` Key and delete the last line's comma.

10. Add the formatted Hangul lyrics into the brackets of `"han": []`.

11. Repeat the same procedure for the Roman and English lyrics starting at step 4, adding the corresponding lyrics to `"rom": []` and `"eng": []`.

## Setup

1. Install [OpenJDK 8](https://openjdk.java.net/) (`sudo apt install openjdk-8-jdk`) **Note:** Java 8 is my recommended version for Flutter projects as of May 2020
2. Make sure Java is installed by running `java -version`, if it doesn't work then you may need to add `java` to your `PATH`
3. Install [Android Studio](https://developer.android.com/studio/)
4. Install [Flutter](https://flutter.dev/docs/get-started/install) and make sure it's on your `PATH`
5. Install Flutter plugin for Android Studio
6. Run `flutter doctor --android-licenses` and accept all licenses
7. Verify everything is good by running `flutter doctor`
8. Clone the repository via `git clone https://github.com/airicbear/iu-lyrics` or Android Studio's integrated version control
9. Open the project in Android Studio
10. Add Dart SDK to Android Studio from your Flutter installation (e.g. `~/development/flutter/bin/cache/dart-sdk/`)
