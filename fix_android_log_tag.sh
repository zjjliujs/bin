#!/bin/bash
find . -name '*.java'|xargs sed -i 's/\/\/\(private static final String LOG_TAG = Device.MODEL\)/\1/'

find . -name '*.java'|xargs sed -i 's/\(^[ \t]*\)\(private static final String LOG_TAG = (\"ljs:\"\)/\1\/\/\2/'
