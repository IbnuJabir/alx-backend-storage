#!/usr/bin/env python3
""" Redis Module """

import redis
import requests
from typing import Callable
from functools import wraps


def count_requests(method: Callable) -> Callable:
    """Decorator to count how many times a URL is accessed."""
    @wraps(method)
    def wrapper(url: str) -> str:
        r = redis.Redis()
        count_key = f"count:{url}"
        r.incr(count_key)
        return method(url)
    return wrapper


@count_requests
def get_page(url: str) -> str:
    """Fetches the content of the URL and caches it with an expiration."""
    r = redis.Redis()
    cache_key = f"cache:{url}"
    cached_content = r.get(cache_key)

    if cached_content:
        return cached_content.decode('utf-8')

    response = requests.get(url)
    content = response.text

    # Cache the result with an expiration of 10 seconds
    r.setex(cache_key, 10, content)

    return content
