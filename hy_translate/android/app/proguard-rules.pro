# llamadart / FFI (native code looks up classes by name)
-keep class com.llamadart.** { *; }
-keep class io.flutter.plugin.** { *; }
# ML Kit text recognition optional language modules
-dontwarn com.google.mlkit.vision.text.chinese.**
-dontwarn com.google.mlkit.vision.text.devanagari.**
-dontwarn com.google.mlkit.vision.text.japanese.**
-dontwarn com.google.mlkit.vision.text.korean.**
# Flutter deferred components / Play core (not used)
-dontwarn com.google.android.play.core.**
