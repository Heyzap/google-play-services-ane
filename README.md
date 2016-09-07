# Google Play Services ANE

A thin wrapper around the [Google Play Services](https://developers.google.com/android/guides/overview) Android SDK for use on Heyzap's mediation.

The latest release can be found in [Releases](https://github.com/Heyzap/google-play-services-ane/releases).

Pull requests and issues are welcome.

#### Google Play Services version
- Play Services Ads: 8.3.0
- Android Support v4: 24.2.0 ( with all related libraries )


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
Since sdk 30 google broke down Google Play Services into multiple libraries. To find GPS Ads please take a look into:
`<sdk>/extras/google/m2repository/com/google/android/gms` after updating SDK version to the most recent.

The individual libraries are in `aar` format, so you'll have to extract the jar yourself.

The following `.aar` are used ( along with valid `.jar` names you should use in `android\libs` folder):

play-services-ads-x.x.x.aar -> google-play-services.jar
play-services-basement-x.x.x.aar ->  play-services-basement.jar

support-v4-x.x.x.aar -> supportv4.jar
support-core-utils-x.x.x.aar -> support-core-utils.jar,support-core-utils-internal_impl.jar
support-fragment-x.x.x.aar -> support-fragment.jar,support-fragment-internal_impl.jar
support-compat-x.x.x.aar -> support-compat.jar
support-annotations-x.x.x.aar -> support-annotations.jar


- Replace all `.jar` files in `android/libs` with a newer version ( in `.aar` version rename classes.jar to valid `.jar`).

- Update `android/platform.xml` with any new android libraries that the newer version might be dependent on. Android libraries can be added under the _packagedDependencies_ tag. The actual `.jar` files can be added to the `andorid/libs` directory.

- Copy all resources ( from every `.aar` ) to `src-resources` folder into valid sub folder. They will be automatically added to the build.

After making the necessary modifications, build the new ANE by following the [building](#building) instructions below.

##### Requirements:
- Mac OS X
- XCode
- [Apache Ant](http://ant.apache.org/)
- [AIR SDK](http://www.adobe.com/devnet/air/air-sdk-download.html)

##### Building:
- Make a `build.config` by copying `build.config.dist` (your local config file)
- Change the path to the AIR SDK in `build.config` (named `air.sdk`)
- From the root of the repository, run `ant`.

After build completes, the native extension will be in `bin/UnityAds.ane`.
