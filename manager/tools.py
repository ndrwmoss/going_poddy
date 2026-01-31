import time
import datetime
from collections import deque
# list of dictionaries
_log = deque([])
# Current download id
_current_id = 0

def get_download_id():
    _current_id = _current_id + 1
    return str(_current_id)
def log(type = 'success', msg = 'default message', download_id = 'none', download_percentage = 'new'):
    current_time = time.time()
    time_stamp = datetime.datetime.fromtimestamp(current_time).strftime('%Y-%m-%d %H:%M:%S')
    if download_id == 'none':
        _log.appendleft({
            'msg': msg,
            'type': type,
            'download': 'false',
            'id': '0',
            'percentage' : '0',
            'time': time_stamp
        })
    else:
        if download_percentage == 'new':
            _log.appendleft({
                'msg': msg,
                'type': type,
                'download': 'true',
                'id': download_id,
                'percentage' : '0',
                'time': time_stamp
            })
        else:
            for d in _log:
                if d['id'] == download_id:
                    d['percentage'] = download_percentage
                    d['time'] = time_stamp
    if (len(_log) > 100):
        _log.pop()
