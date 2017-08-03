# Google Play Services ANE

A thin wrapper around the [Google Play Services](https://developers.google.com/android/guides/overview) Android SDK for use on Heyzap's mediation.

The latest release can be found in [Releases](https://github.com/Heyzap/google-play-services-ane/releases).

Pull requests and issues are welcome.

#### Google Play Services version
- Play Services Ads: 11.0.4
- Android Support v4: 25.3.1 ( with all related libraries )

#### Adding to your project

- Add the `GooglePlayServices.ane` to your project.
- Follow the [integration instructions on Heyzap](https://developers.heyzap.com/docs/ane_setup_and_requirements#step-3-modify-your-application-descriptor) or add the following permissions and activities to your Android Manifest in your application descriptor:
	
	```xml
	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
	<uses-permission android:name="android.permission.INTERNET" />
	<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
	```

	```xml
	<meta-data android:name="com.google.android.gms.version" android:value="@integer/google_play_services_version" />
	
	<activity android:name="com.google.android.gms.ads.AdActivity" android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" />
	```

- If not done automatically, add the follow extension context to your application descriptor:

	```xml
	<extensions>
	    <extensionID>com.heyzap.sdk.extensions.googleplayservices</extensionID>
	</extensions>
	```

#### Updating Google Play Services

Make sure your Android SDK is updated to latest. This will always use the latest version available in your local SDK repository.

##### Requirements:
- Mac OS X
- XCode
- [Apache Ant](http://ant.apache.org/)
- [Apache Maven](http://maven.apache.org/)
- [AIR SDK](http://www.adobe.com/devnet/air/air-sdk-download.html)

##### Building:
- Make a `build.config` by copying `build.config.dist` (your local config file)
- Change the path to the AIR SDK in `build.config` (named `air.sdk`)
- Change the path to the Android SDK in `build.config` (named `android.sdk`)
- From the root of the repository, run `ant`.

After build completes, the native extension will be in `bin/GooglePlayServices.ane`.
