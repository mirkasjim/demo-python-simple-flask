#!/usr/bin/env python

import sys

instruction = sys.argv[1]

if instruction == "pre":
    print("Running pre deployment");
    exit(0);
elif instruction == "post":
    print("Running post deployment");
    exit(0);
elif instruction == "cron":
    print("Running cron");
    exit(0);
else:
    print("Unknown instruction");
    exit(255);
