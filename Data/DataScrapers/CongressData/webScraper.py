# -*- coding: utf-8 -*-
"""
Created on Thu Nov  3 14:55:41 2016

@author: shaan
"""

import urllib.request
import pandas as pd
from bs4 import BeautifulSoup
congress = "http://www.infoplease.com/ipa/A0774721.html"
page = urllib.request.urlopen(congress)
soup = BeautifulSoup(page)
print (right_table)

#Generate lists
congress=[]
years=[]
totalS=[]
demsS=[]
repsS=[]
othersS=[]
vacantsS=[]
totalH=[]
demsH=[]
repsH=[]
othersH=[]
vacantsH=[]
table=soup.find('table', class_='tableizer-table')
for row in table.find_all('tr')[2:]:
    col = row.find_all('td')
    print(len(col))
    # Create a variable of the string inside 1st <td> tag pair,
    column_1 = col[0].string.strip()
    # and append it to first_name variable
    congress.append(column_1)

    # Create a variable of the string inside 2nd <td> tag pair,
    column_2 = col[1].string.strip()
    # and append it to last_name variable
    years.append(column_2)

    # Create a variable of the string inside 3rd <td> tag pair,
    column_3 = col[2].string.strip()
    # and append it to age variable
    totalS.append(column_3)

    # Create a variable of the string inside 4th <td> tag pair,
    column_4 = col[3].string.strip()
    # and append it to preTestScore variable
    demsS.append(column_4)

    # Create a variable of the string inside 5th <td> tag pair,
    column_5 = col[4].string.strip()
    # and append it to postTestScore variable
    repsS.append(column_5)
    
    column_6 = col[5].string.strip()
    # and append it to first_name variable
    othersS.append(column_6)

    # Create a variable of the string inside 2nd <td> tag pair,
    column_7 = col[6].string.strip()
    # and append it to last_name variable
    vacantsS.append(column_7)

    # Create a variable of the string inside 3rd <td> tag pair,
    totalH.append(col[7].find(text=True))
    demsH.append(col[8].find(text=True))
    repsH.append(col[9].find(text=True))
    othersH.append(col[10].find(text=True))
    vacantsH.append(col[11].find(text=True))

    

columns = {'congress': congress, 'years': years, 'totalS': totalS, 'demsS': demsS, 'repsS': repsS, 'othersS': othersS, 'vacantsS': vacantsS, 'totalH': totalH, 'demsH': demsH, 'repsH': repsH, 'othersH': othersH, 'vacantsH': vacantsH} 
df = pd.DataFrame(columns)
df.to_csv('out.csv')
"""'totalH': totalH, 'demsH': demsH, 'repsH': repsH, 'othersH': othersH, 'vacantsH': vacantsH}"""
