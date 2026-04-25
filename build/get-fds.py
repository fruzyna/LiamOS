# Determine the latest available FIRST Driver Station release, then download the corresponding build
from requests import get
from urllib.request import urlretrieve

RELEASES_URL = 'https://github.com/wpilibsuite/FirstDriverStation-Public/releases'
EXTENSION_PATH = '/tmp/FirstDriverStation.tar.gz'

res = get(f'{RELEASES_URL}/latest')
if res.status_code == 200:
    version = res.url.split('/')[-1][1:]
    extension_url = f'{RELEASES_URL}/download/v{version}/FirstDriverStation-linux-x64-{version}.tar.gz'

    print('Downloading:', extension_url, 'to', EXTENSION_PATH)
    urlretrieve(extension_url, EXTENSION_PATH)