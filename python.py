import json

result = None

# Describe this function...
def handle():

  result = dict()
  result['yo'] = 'yi';
  def request1():
      import urllib.request
      request = urllib.request.Request('https://webhook.site/7f740d6c-d0c6-4775-ba54-12510fdf462c', data=json.dumps(result).encode('utf-8'), method='POST')
      return urllib.request.urlopen(request).read().decode('utf-8')
  return request1()

handle()
