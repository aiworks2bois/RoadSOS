plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    // Gap 4: Firebase — requires google-services.json in android/app/
    // Download from Firebase Console -> Project Settings -> Android app.
    id("com.google.gms.google-services")
}

android {
    namespace = "io.roadsos.roadsos"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "io.roadsos.roadsos"
        // Gap 6: minSdk 26 = Android 8.0 (Oreo). Hard minimum per NFR.
        // Prevents installation on Android 5/6 where the app would crash immediately.
        minSdk = 26
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    buildTypes {
        release {
            // Gap 9: Enable minify + proguard for release builds.
            // proguard-rules.pro contains rules for flutter_secure_storage, Firebase, etc.
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            // TODO: Replace debug signing with your production signing config.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
