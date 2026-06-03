plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "io.roadsos.roadsos"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
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

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")
}

// Gap 4: Firebase — conditionally apply google-services if config exists.
// Prevents CI from failing when the gitignored google-services.json is missing.
if (file("google-services.json").exists()) {
    apply(plugin = "com.google.gms.google-services")
}
