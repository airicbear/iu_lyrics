# IU Lyrics <img src="./assets/screenshots/launcher.png" width="64" alt="App icon">

A clean and simple lyrics app for IU's songs.

## Screenshots

[<img src="./assets/screenshots/home.png" alt="Home page screenshot" width="270" height="480">](./assets/screenshots/home.png)
[<img src="./assets/screenshots/album.png" alt="Album page screenshot" width="270" height="480">](./assets/screenshots/album.png)
[<img src="./assets/screenshots/song.png" alt="Song page screenshot" width="270" height="480">](./assets/screenshots/song.png)

## Lyrics Resources

These are some of the websites I used to find the lyrics:

- [AZLyrics](https://www.azlyrics.com/i/iu.html)
- [ColorCodedLyrics](https://colorcodedlyrics.com/2018/02/iu-aiyu-lyrics-index)
- [Genius](https://genius.com/artists/Iu)

## Contributing

The easiest way to directly contribute is to edit the `iu.json` file located in the `assets/` directory.
As for adding features and such, I'm afraid I am not competent enough in Flutter or any mobile development, for that matter.
Pull requests, issues, and the like, are all very much welcome and encouraged, however small their contribution may be.

## Setup

1. Install OpenJDK or [OracleJDK](https://www.oracle.com/technetwork/java/javase/downloads/index.html) (both available via apt)
2. Make sure Java is installed by running `java --version`, if it doesn't work then you may need to add java to your PATH
3. Install [Android Studio](https://developer.android.com/studio/) (available via [snap](https://snapcraft.io/android-studio))
4. Install [Flutter](https://flutter.dev/docs/get-started/install)
5. Install Flutter plugin for Android Studio
6. Run `flutter doctor --android-licenses` and accept all licenses
7. Verify everything is good by running `flutter doctor`
8. Clone the repository via `git clone https://github.com/airicbear/iu-lyrics` or Android Studio's integrated version control
9. Open the project in Android Studio
10. Add Dart SDK to Android Studio from your Flutter installation (e.g. `~/development/flutter/bin/cache/dart-sdk/`)

