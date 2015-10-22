#!/bin/bash
jcmd|grep mgdbservice|awk '{print $1}'|xargs kill
