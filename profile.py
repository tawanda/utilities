"""
USAGE

    @profileit
    def function_you_want_to_profile(...)
        ...

HOWTO

Add this decorator to any function you want to profile, it generates a .profile file in the root dir
e.g get()__2021_03_23__06_20_38.profile
You can open this file in pycharm with

Tools->Open cProfile Snapshot  # Very last option at bottom

or you cna use something like https://jiffyclub.github.io/snakeviz/

"""

import cProfile
from datetime import datetime


def profileit(func):
    def wrapper(*args, **kwargs):
        # Name the data file sensibly
        datafn = func.__name__ + datetime.now().strftime("()__%Y_%m_%d__%H_%M_%S.profile")
        prof = cProfile.Profile()
        retval = prof.runcall(func, *args, **kwargs)
        prof.dump_stats(datafn)
        return retval
    return wrapper
