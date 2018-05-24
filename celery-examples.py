from __future__ import absolute_import, unicode_literals

import logging

from time import sleep

from celery.task import task
from celery.exceptions import SoftTimeLimitExceeded

logger = logging.getLogger(__name__)


@task(name="sum_two_numbers")
def add(x, y):
    return x + y


@task(name="sum_list_numbers")
def xsum(numbers):
    return sum(numbers)


@task(name="test_retry", bind=True)
def add2(self, x, y):
    try:
        raise Exception()
    except Exception as e:
        logger.error('exception encountered')
        self.retry(countdown=2, exc=e, max_retries=2)
    return x + y


@task(name="test_time_limit", bind=True, time_limit=5, soft_time_limit=3, countdown=10,  max_retries=2)
def add3(self, x, y):
    """
    # Time limit handling might not work on windows
    The time limit (–time-limit) is the maximum number of seconds a task may run before the process executing it is
     terminated and replaced by a new process. You can also enable a soft time limit (–soft-time-limit),
     this raises an exception the task can catch to clean up before the hard time limit kills it:
    """
    try:
        sleep(10)
    except SoftTimeLimitExceeded:
        logger.error('time limit exceeded')
    return x + y


