import sys,json,urllib2,ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE
data = urllib2.urlopen("https://portal.memhamwan.net/host/ansible.json", context=ctx)
jsonData = json.load(data)
finalData = [{'targets': [], 'labels': {}}]
for server in jsonData['server']:
    finalData[0]['targets'].append(server + ":9100")
print json.dumps(finalData, sort_keys=True, indent=2)
