FROM ubuntu:22.04

# Java kurulum
RUN apt-get update && apt-get install -y openjdk-11-jdk wget unzip git curl

# Android SDK kurulumu
ENV ANDROID_SDK_ROOT=/opt/android-sdk-linux
RUN mkdir -p $ANDROID_SDK_ROOT && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O cmdline-tools.zip && \
    unzip cmdline-tools.zip -d $ANDROID_SDK_ROOT && rm cmdline-tools.zip

ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/tools/bin

# SDK manager güncelle ve platform-tools + build-tools yükle
RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Gradle indir (örneğin 7.6)
RUN wget https://services.gradle.org/distributions/gradle-7.6-bin.zip -P /tmp && \
    unzip /tmp/gradle-7.6-bin.zip -d /opt && rm /tmp/gradle-7.6-bin.zip
ENV PATH=$PATH:/opt/gradle-7.6/bin

# Çalışma dizini
WORKDIR /workspace
