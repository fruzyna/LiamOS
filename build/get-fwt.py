# Determine the latest available FIRST Driver Station release, then download the corresponding build
from requests import get
from urllib.request import urlretrieve

RELEASES_URL = 'https://github.com/FrameworkComputer/framework-system/releases'
DOWNLOAD_PATH = '/tmp/framework_tool'

res = get(f'{RELEASES_URL}/latest')
if res.status_code == 200:
    version = res.url.split('/')[-1]
    download_url = f'{RELEASES_URL}/download/{version}/framework_tool'

    print('Downloading:', download_url, 'to', DOWNLOAD_PATH)
    urlretrieve(download_url, DOWNLOAD_PATH)