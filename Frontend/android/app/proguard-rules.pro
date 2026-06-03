# Gap 9: flutter_secure_storage — required to prevent release build obfuscation crash.
# Without these, minify+obfuscate strips the keystore classes and the app crashes
# immediately on first secure token read in production.
-keep class com.it_nomads.fluttersecurestorage.** { *; }
-keep class androidx.security.crypto.** { *; }

# Retrofit / OkHttp (used indirectly via Dio)
-dontwarn okhttp3.**
-keep class retrofit2.** { *; }

# Gson / JSON serialisation (Freezed generated code uses json_annotation)
-keepattributes Signature
-keepattributes *Annotation*
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Flutter-specific
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# geolocator
-keep class com.baseflow.geolocator.** { *; }

# permission_handler
-keep class com.baseflow.permissionhandler.** { *; }

# Flutter Deferred Components (Missing classes during R8 minify)
-dontwarn com.google.android.play.core.**
