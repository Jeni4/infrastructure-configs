import sys,json,urllib2

data = urllib2.urlopen("https://portal.memhamwan.net/host/ansible.json")
jsonData = json.load(data)
finalData = [{'targets': [], 'labels': {}}]
for server in jsonData['mikrotik']:
    finalData[0]['targets'].append(server)
print json.dumps(finalData, sort_keys=True, indent=2)
