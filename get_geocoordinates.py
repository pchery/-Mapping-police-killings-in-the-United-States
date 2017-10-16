import requests
import numpy as np
import pandas
import json
#data = np.genfromtxt('/Users/paulchery/Documents/MPV.tsv',delimiter='\t', skip_header=1)
data = pandas.read_table('/Users/paulchery/Documents/MPV.tsv', sep='\t', header=0).values
coord = np.zeros([10,2])
for i in range(0,10):
#print(np.array_str(data[0]).replace(' ', '+'))
#print(data)
#address = '1600+Amphitheatre+Parkway,+Mountain+View,+CA'
    address = np.array_str(data[i]).replace(' ', '+')
    payload = {'address': address, 'key':'AIzaSyAodpHF-GzGs5yh64kkcKSiVgCgsRbBmmU'}
    r = requests.get('https://maps.googleapis.com/maps/api/geocode/json', params=payload)
    jayson = json.loads(r.text)
    coord[i][0] = jayson['results'][0]['geometry']['location']['lat']
    coord[i][1] = jayson['results'][0]['geometry']['location']['lng']
    print(coord)
    print(r.url)

