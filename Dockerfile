FROM gradle:8.6.0-jdk17-focal

ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:$PATH

RUN mkdir -p ${ANDROID_HOME}/cmdline-tools && \
    curl -sSL https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -o tools.zip && \
    unzip -q tools.zip -d ${ANDROID_HOME}/cmdline-tools && \
    mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest && \
    yes | sdkmanager --licenses && \
    sdkmanager "platform-tools" "build-tools;34.0.0" "platforms;android-34" && \
    rm -rf tools.zip ~/.android/cache