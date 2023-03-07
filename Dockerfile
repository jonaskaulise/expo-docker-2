FROM ubuntu:jammy-20220531
WORKDIR /app
ENV ANDROID_HOME /usr/lib/android-sdk
# ENV ANDROID_NDK_HOME /usr/lib/android-sdk/ndk/24.0.8215888
# ENV ANDROID_NDK_HOME /usr/lib/android-sdk/ndk/21.4.7075529
# ENV ANDROID_NDK_HOME /app/android-ndk-r21e
ENV PATH $PATH:/usr/lib/android-sdk/cmdline-tools/latest/bin
COPY . .
RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y openjdk-8-jre && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install wget && \
    # wget https://dl.google.com/android/repository/android-ndk-r21e-linux-x86_64.zip && \
    apt-get install unzip && \
    # unzip android-ndk-r21e-linux-x86_64.zip && \
    # rm android-ndk-r21e-linux-x86_64.zip && \
    npm install -g eas-cli && \
    npm install -g sharp-cli && \
    apt-get install -y android-sdk && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip commandlinetools-linux-9477386_latest.zip && \
    rm commandlinetools-linux-9477386_latest.zip && \
    # mkdir /usr/lib/android-sdk && \
    mkdir /usr/lib/android-sdk/cmdline-tools && \
    mv cmdline-tools /usr/lib/android-sdk/cmdline-tools/latest

#added jsEngine to app.json
#next try: prebuild and set hermes command
