import sys,json,urllib2
import ssl

# This restores the same behavior as before.
context = ssl._create_unverified_context()
data = urllib2.urlopen("https://portal.memhamwan.net/host/ansible.json", context=context)
jsonData = json.load(data)
finalData = [{'targets': [], 'labels': {}}]
for server in jsonData[sys.argv[1]]:
    if len(sys.argv) > 3:
        finalData[0]['targets'].append(server + sys.argv[3])
    else:
        finalData[0]['targets'].append(server)
with open(sys.argv[2], "w") as text_file:
    text_file.write(json.dumps(finalData, sort_keys=True, indent=2))
